//
//  ZHAddTabBar.swift
//  ZHTabBarController
//
//  Created by Sunny on 15/10/4.
//  Copyright © 2015年 sunny. All rights reserved.
//

import UIKit

public final class ZHAddTabBar: ZHTabBar {
    fileprivate let centerBtn = UIImageView()
    var btnClickBlock:(() -> Void)?
    
    func didTap() {
        if let tap = btnClickBlock {
            tap()
        } else {
            print("!!!You must assign to btnClickBlock")
        }
    }
    
    override func adjustItemFrame() {
        let width = frame.height
        centerBtn.isUserInteractionEnabled = true
        centerBtn.frame = CGRect(origin: CGPoint(x: (SCREEN_WIDTH-width)/2, y: 0), size: CGSize(width: width, height: width))
        centerBtn.backgroundColor = UIColor.clear
        centerBtn.contentMode = UIViewContentMode.scaleAspectFit
        centerBtn.image = UIImage(named: "centerBtn")
        centerBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ZHAddTabBar.didTap)))
        addSubview(centerBtn)
        
        let count = subviews.count - 1
        let itemWidth = frame.size.width / CGFloat(count+1)
        let itemHeight = frame.size.height
        for i in 0..<count {
            let item = subviews[i] as! ZHBarItem
            item.tag = i
            if i < 2 {
                item.frame = CGRect(x: CGFloat(i) * itemWidth, y: 0, width: itemWidth, height: itemHeight)
            } else {
                item.frame = CGRect(x: CGFloat(i+1) * itemWidth, y: 0, width: itemWidth, height: itemHeight)
            }
        }
    }
}
