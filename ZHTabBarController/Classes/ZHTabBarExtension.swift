//
//  ZHTabBarConfig.swift
//  ZHTabBarController
//
//  Created by Sunny on 15/10/4.
//  Copyright © 2015年 sunny. All rights reserved.
//

import UIKit

let kViewWidth:CGFloat     = UIScreen.main.bounds.size.width
let kViewHeight:CGFloat    = UIScreen.main.bounds.size.height

extension UIColor {
    class func kColor(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    class func aColor(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
