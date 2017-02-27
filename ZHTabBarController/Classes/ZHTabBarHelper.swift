//
//  ChildVCHelper.swift
//  ZHSideMenu
//
//  Created by Sunny on 15/4/7.
//  Copyright (c) 2015年 Sunny. All rights reserved.
//

import UIKit

//分离创建子控制器方法
class ZHTabBarHelper: NSObject {
    class func create(_ parentVC:UIViewController) {
        let vc = HomeViewController()
        vc.title = ZHItemTitles[0]
        let homeVC = UINavigationController(rootViewController:vc)
        parentVC.addChildViewController(homeVC)
        
        let vc1 = HomeViewController()
        vc1.title = ZHItemTitles[1]
        let homeVC1 = UINavigationController(rootViewController: vc1)
        parentVC.addChildViewController(homeVC1)
        homeVC1.view.backgroundColor = UIColor.red
        
        let vc2 = HomeViewController()
        vc2.title = ZHItemTitles[2]
        let homeVC2 = UINavigationController(rootViewController: vc2)
        parentVC.addChildViewController(homeVC2)
        homeVC2.view.backgroundColor = UIColor.purple
        
        let vc3 = HomeViewController()
        vc3.title = ZHItemTitles[3]
        let homeVC3 = UINavigationController(rootViewController: vc3)
        parentVC.addChildViewController(homeVC3)
        homeVC3.view.backgroundColor = UIColor.yellow
        
        UINavigationBar.appearance().barTintColor = ZHTabBarColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }
}

class HomeViewController:UIViewController {
    override func viewDidLoad() {
        let label  = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 200)
        label.text = ":)"
        label.frame = view.frame
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
    }
}
