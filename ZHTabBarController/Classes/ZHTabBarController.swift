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

public class ZHTabBarController: UIViewController {
    
    public var delegate: ZHTabBarControllerProtocol!
    public var tabBarColor = UIColor.white
    public var itemTitleColor = UIColor.black
    public var itemSelectedTitleColor = UIColor.black
    public var allowSwitchTabClosure: ((_ index: Int) -> Bool)?
    
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
}

extension ZHTabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        for vc in delegate.childViewControllers {
            addChildViewController(vc)
        }
        
        view.addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - tabBarHeight)
        
        view.addSubview(tabBar)
        for item in delegate.items {
            tabBar.add(item: item, titleColor: itemTitleColor, selectedTitleColor: itemSelectedTitleColor)
        }
        tabBar.backgroundColor = tabBarColor
        tabBar.itemClickBlock = { index in
            let newVC = self.childViewControllers[index]
            if newVC == self.selectedVC {
                return
            }
            self.selectedVC?.view.removeFromSuperview()
            self.contentView.addSubview(newVC.view)
            newVC.view.frame = self.contentView.bounds
            self.selectedVC = newVC
            self.title = self.selectedVC!.title
        }
        tabBar.allowSwitchTabClosure = allowSwitchTabClosure
        switchTab(AtIndex: 0) // default selection
    }
    
    public func switchTab(AtIndex index: Int) {
        tabBar.selectedIndex = index
    }
}
