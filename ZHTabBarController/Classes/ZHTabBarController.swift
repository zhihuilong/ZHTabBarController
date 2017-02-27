//
//  CenterViewController.swift
//  ZHSideMenu
//
//  Created by Sunny on 15/4/4.
//  Copyright (c) 2015年 Sunny. All rights reserved.
//

import UIKit

class ZHTabBarController: UIViewController{
    
    fileprivate var selectedVC:UIViewController?
    fileprivate let tabBar = ZHTabBar()
    fileprivate let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI() {
        navigationController?.navigationBar.isHidden = true
        ZHTabBarHelper.create(self)
        addTabBar()
    }
    
    fileprivate func addTabBar() {
        view.addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: kViewWidth, height: kViewHeight - ZHTabBarHeight)
        view.addSubview(tabBar)
        for i in 0 ..< ZHItemCount {
            tabBar.addBaritem(ZHItemIcons[i], title: ZHItemTitles[i])
        }
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


