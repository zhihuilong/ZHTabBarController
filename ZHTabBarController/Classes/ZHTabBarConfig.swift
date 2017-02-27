//
//  ZHTabBarConfig.swift
//  ZHTabBarController
//
//  Created by Sunny on 15/10/4.
//  Copyright © 2015年 sunny. All rights reserved.
//

import UIKit

/************** Gerenal Configuration **************/
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

/************** Framework Configuration **************/
//ZHNavBar
let ZHNavBarHeight:CGFloat = 44.0

//ZHTabBar
let ZHTabBarColor          = UIColor.kColor(35, green: 41, blue: 44)
let ZHTabBarHeight:CGFloat = 50

//ZHBaritem
let ZHHasTitle             = true
let ZHImageRatio:CGFloat   = 0.65
let ZHBarFont              = UIFont.systemFont(ofSize: 11)
let ZHBarBackColor         = UIColor.kColor(19, green: 22, blue: 23)
let ZHBarTitleColor        = UIColor.white
let ZHBarSelectedColor     = UIColor.white
let ZHCenterBtnColor       = UIColor.clear
let ZHCenterBtnImage       = UIImage(named: "centerBtn")

//创建子控制器
let ZHItemCount            = 4
let ZHItemIcons            = ["tab1","tab2","tab3","tab4"]
let ZHItemTitles           = ["Home","Contacts","Discovery","Me"]
