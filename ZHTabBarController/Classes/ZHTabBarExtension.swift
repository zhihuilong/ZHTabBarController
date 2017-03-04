//
//  ZHTabBarConfig.swift
//  ZHTabBarController
//
//  Created by Sunny on 15/10/4.
//  Copyright © 2015年 sunny. All rights reserved.
//

import UIKit

let SCREEN_WIDTH: CGFloat  = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

extension UIColor {
    class func rgb(red red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    class func rgba(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
