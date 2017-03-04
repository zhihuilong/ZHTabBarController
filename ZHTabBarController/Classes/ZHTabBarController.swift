//
//  CenterViewController.swift
//  ZHSideMenu
//
//  Created by Sunny on 15/4/4.
//  Copyright (c) 2015年 Sunny. All rights reserved.
//

import UIKit

@objc public protocol ZHTabBarControllerProtocol {
    var childViewControllers: [UIViewController] { get }
    var items: [ZHItemData] { get }
}

@objc public enum ZHTabBarStyle: Int {
    case Default        // build-in
    case CentralButton  // central button like Instagram
}

public final class ZHItemData: NSObject {
    let icon: String
    let selectedIcon: String
    let title: String?
    
    public init(icon: String, selectedIcon: String, title: String? = nil) {
        self.icon = icon
        self.selectedIcon = selectedIcon
        self.title = title
        super.init()
    }
}

public final class ZHTabBarController: UIViewController {
    
    public var delegate: ZHTabBarControllerProtocol!
    public var tabBarColor = UIColor.white
    public var itemTitleColor = UIColor.black
    public var itemSelectedTitleColor = UIColor.black
    
    fileprivate var selectedVC:UIViewController?
    fileprivate let contentView = UIView()
    fileprivate let style: ZHTabBarStyle
    fileprivate let tabBarHeight: CGFloat
    fileprivate let tabBar: ZHTabBar
    
    public init(style: ZHTabBarStyle = .Default, tabBarHeight: CGFloat = 50) {
        self.style = style
        self.tabBarHeight = tabBarHeight
        self.tabBar = ZHTabBar(height: tabBarHeight)
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        for vc in delegate.childViewControllers {
            addChildViewController(vc)
        }
        
        // addTabBar
        view.addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - tabBarHeight)
        
        view.addSubview(tabBar)
        for item in delegate.items {
            tabBar.add(item: item, titleColor: itemTitleColor, selectedTitleColor: itemSelectedTitleColor)
        }
        tabBar.backgroundColor = tabBarColor
        tabBar.selectedIndex = 0
        tabBar.itemClickBlock = { index in
            self.selectViewController(index)
        }
        
        // default select first controller
        selectViewController(0)
    }
    
    func selectViewController(_ index:Int) {
        let newVC = childViewControllers[index]
        if newVC == selectedVC {
            return
        }
        selectedVC?.view.removeFromSuperview()
        contentView.addSubview(newVC.view)
        newVC.view.frame = contentView.bounds
        selectedVC = newVC
        title = selectedVC!.title
    }
}
