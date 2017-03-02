# ZHTabBarController

[![CI Status](http://img.shields.io/travis/zhihuilong/ZHTabBarController.svg?style=flat)](https://travis-ci.org/zhihuilong/ZHTabBarController)
[![Version](https://img.shields.io/cocoapods/v/ZHTabBarController.svg?style=flat)](http://cocoapods.org/pods/ZHTabBarController)
[![License](https://img.shields.io/cocoapods/l/ZHTabBarController.svg?style=flat)](http://cocoapods.org/pods/ZHTabBarController)
[![Platform](https://img.shields.io/cocoapods/p/ZHTabBarController.svg?style=flat)](http://cocoapods.org/pods/ZHTabBarController)


An alternative for UITabBarController，which support all kinds of Custom TabBarController.

<!--## What it look like 

Icon & Title:

![图片名](https://raw.githubusercontent.com/longzhihui/XHTabBarController/master/ScreenShot/01.png)

Icon without Title:

![图片名](https://raw.githubusercontent.com/longzhihui/XHTabBarController/master/ScreenShot/02.png)

Center Button:

![图片名](https://raw.githubusercontent.com/longzhihui/XHTabBarController/master/ScreenShot/03.png)-->

## Requirements

Compatible with Xcode 8.2 / Swift 3.0

## Installation

ZHTabBarController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

``` ruby
platform :ios, '8.0'
use_frameworks!

pod "ZHTabBarController"
```

## Basic usage

1.Import ZHTabBarController module.

Swift:
```
import ZHTabBarController
```

Obj-C:
```
@import ZHTabBarController;
```

2.Make sure your AppDelegate confirm ZHTabBarControllerProtocol and implement two computing variables.

```
    var childViewControllers: [UIViewController] { get }
    var itemIconTitleDictionary: [String: String] { get }
```

3.Replace the default 'applicationDidFinishLaunching(_ application: UIApplication)' method.

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let vc = ZHTabBarController()
    vc.delegate = self
    window!.rootViewController = UINavigationController(rootViewController: vc)
    window!.makeKeyAndVisible()
    return true
}
```

<!--## Customization-->


## Author

Zhihui, zhihui.me@gmail.com

## License

ZHTabBarController is available under the MIT license. See the LICENSE file for more info.
