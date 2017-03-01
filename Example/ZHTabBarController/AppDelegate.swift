//
//  AppDelegate.swift
//  ZHTabBarController
//
//  Created by longzhihui on 02/27/2017.
//  Copyright (c) 2017 longzhihui. All rights reserved.
//

import UIKit
import ZHTabBarController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ZHTabBarControllerProtocol {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        application.statusBarStyle = UIStatusBarStyle.lightContent
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ZHTabBarController()
        vc.delegate = self
        window!.rootViewController = UINavigationController(rootViewController: vc)
        window!.backgroundColor = UIColor.white
        window!.makeKeyAndVisible()
        return true
    }

    var itemIconTitleDictionary: [String : String] {
        return ["icon1" : "title1",
                "icon2" : "title2",
                "icon3" : "title3",
                "icon4" : "title4"]
    }
    
    var childViewControllers: [UIViewController] {
        let vc = HomeViewController()
        let homeVC = UINavigationController(rootViewController:vc)
        
        let vc1 = HomeViewController()
        let homeVC1 = UINavigationController(rootViewController: vc1)
        homeVC1.view.backgroundColor = UIColor.red
        
        let vc2 = HomeViewController()
        let homeVC2 = UINavigationController(rootViewController: vc2)
        homeVC2.view.backgroundColor = UIColor.purple
        
        let vc3 = HomeViewController()
        let homeVC3 = UINavigationController(rootViewController: vc3)
        homeVC3.view.backgroundColor = UIColor.yellow
        
        return [homeVC, homeVC1, homeVC2, homeVC3]
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

