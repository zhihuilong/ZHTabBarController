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
    var itemIconTitleDictionary: [String: String] { get }
}

public final class ZHTabBarController: UIViewController {
    
    public var delegate: ZHTabBarControllerProtocol!
    public var tabBarColor = UIColor.kColor(35, green: 41, blue: 44)
    
    fileprivate var selectedVC:UIViewController?
    fileprivate let tabBar = ZHTabBar()
    fileprivate let contentView = UIView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        for vc in delegate.childViewControllers {
            addChildViewController(vc)
        }
        
        // navbar
        navigationController?.navigationBar.isHidden = true
        UINavigationBar.appearance().barTintColor = tabBarColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        addTabBar()
    }
    
    fileprivate func addTabBar() {
        view.addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: kViewWidth, height: kViewHeight - ZHTabBarHeight)
        view.addSubview(tabBar)
        for (icon, title) in delegate.itemIconTitleDictionary {
            tabBar.addBaritem(icon, title: title)
        }
        tabBar.backgroundColor = tabBarColor
        tabBar.selectedIndex = 0
        tabBar.itemClickBlock = {(index:Int) in
            self.selectViewController(index)
        }
        
        selectViewController(0) // default
    }
    
    func selectViewController(_ index:Int) {
        let newVC = childViewControllers[index]
        if newVC == selectedVC {
            return
        }
        selectedVC?.view.removeFromSuperview()
        contentView.addSubview(newVC.view)
        newVC.view.frame = view.bounds
        selectedVC = newVC
        title = selectedVC!.title
//        隐藏导航栏
//        if newVC.isKindOfClass(SettingViewController) {
//            navigationController?.navigationBar.hidden = true
//            newVC.view.frame = view.bounds
//        } else {
//            navigationController?.navigationBar.hidden = false
//            newVC.view.frame = contentView.bounds
//        }
    }
}


