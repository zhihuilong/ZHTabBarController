//
//  ZHTabBar.swift
//  ZHTabBar
//
//  Created by Sunny on 15/4/18.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class ZHTabBar: UIView {
    fileprivate var currentItem:ZHBarItem?
    var itemClickBlock:((_ index:Int) -> Void)?
    
    var selectedIndex:Int? {
        didSet {
            if selectedIndex < 0 || selectedIndex >= subviews.count {
                return
            }
            let item = subviews[selectedIndex!] as! ZHBarItem
            itemClick(item)
        }
    }
    
    init() {
        super.init(frame:CGRect.zero)
        createUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createUI() {
        backgroundColor = ZHTabBarColor
        self.frame = CGRect(x: 0, y: kViewHeight-ZHTabBarHeight, width: kViewWidth, height: ZHTabBarHeight)
    }
    
    //public API：添加item
    func addBaritem(_ icon:String,title:String) {
        let item = ZHBarItem()
        addSubview(item)
        item.setTitle(title, for: UIControlState())
        item.setImage(UIImage(named: icon), for: UIControlState())
        item.setImage(UIImage(named: "\(icon)_highlight"), for: UIControlState.selected)
        item.addTarget(self, action: #selector(ZHTabBar.itemClick(_:)), for: UIControlEvents.touchDown)
        adjustItemFrame()
    }
    
    func itemClick(_ item:ZHBarItem) {
        if item == currentItem {
            return
        }
        if currentItem != nil {
            currentItem!.isSelected = false
        }
        item.isSelected = true
        currentItem?.backgroundColor = UIColor.clear
        currentItem = item
        currentItem?.backgroundColor = ZHBarBackColor
        if let tap = itemClickBlock {
            tap(item.tag)
        } else {
            print("!!!You must assign to itemClickBlock.")
        }
    }
    
    func adjustItemFrame() {
        let count = subviews.count
        let itemWidth = frame.size.width / CGFloat(count)
        let itemHeight = frame.size.height
        for i in 0..<count {
            let item = subviews[i] as! ZHBarItem
            item.tag = i
            item.frame = CGRect(x: CGFloat(i) * itemWidth, y: 0, width: itemWidth, height: itemHeight)
        }
    }
}
