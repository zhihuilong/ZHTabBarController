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
        vc.tabBarColor = UIColor.white
        vc.itemTitleColor = UIColor.black
        vc.itemSelectedTitleColor = UIColor.black
        vc.delegate = self
        vc.allowSwitchTabClosure = { index in
            
            if index == 3 {
                let present = UIViewController()
                self.window?.rootViewController?.present(present, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                    present.dismiss(animated: true, completion: nil)
                }
                return false
            }
            return true
        }
        window!.rootViewController = UINavigationController(rootViewController: vc)
        
        // navbar
        UINavigationBar.appearance().isHidden = true
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        window!.backgroundColor = UIColor.white
        window!.makeKeyAndVisible()
        return true
    }
    
    var items: [ZHItemData] {
        return [ZHItemData(icon: "home_line", selectedIcon: "home_shape", title: "Home"),
                ZHItemData(icon: "journey_line", selectedIcon: "journey_shape", title: "Journey"),
                ZHItemData(icon: "discover_line", selectedIcon: "discover_shape", title: "Discovery"),
                ZHItemData(icon: "my_2_line", selectedIcon: "my_2_shape", title: "Profile")]
    }
    
    var childViewControllers: [UIViewController] {
        let vc = HomeViewController()
        vc.view.backgroundColor = UIColor.orange
        
        let vc1 = HomeViewController()
        vc1.view.backgroundColor = UIColor.red
        
        let vc2 = HomeViewController()
        vc2.view.backgroundColor = UIColor.purple
        
        let vc3 = HomeViewController()
        vc3.view.backgroundColor = UIColor.yellow
        
        return [vc, vc1, vc2, vc3]
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

