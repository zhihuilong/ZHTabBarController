//
//  ZHTabBar.swift
//  ZHTabBar
//
//  Created by Sunny on 15/4/18.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

let ZHTabBarHeight:CGFloat = 50

public class ZHTabBar: UIView {
    
    var titleColor = UIColor.white
    var selectedTitleColor = UIColor.white
    var itemClickBlock:((_ index:Int) -> Void)?
    var selectedIndex:Int! {
        didSet {
            if selectedIndex < 0 || selectedIndex >= subviews.count {
                return
            }
            let item = subviews[selectedIndex] as! ZHBarItem
            itemClick(item)
        }
    }
    
    fileprivate var currentItem:ZHBarItem?

    init() {
        super.init(frame:CGRect.zero)
        createUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createUI() {
        self.frame = CGRect(x: 0, y: kViewHeight-ZHTabBarHeight, width: kViewWidth, height: ZHTabBarHeight)
    }
    
    func addBaritem(_ icon:String,title:String) {
        let item = ZHBarItem()
        addSubview(item)
        item.setTitle(title, for: UIControlState())
        item.setTitleColor(titleColor, for: UIControlState.normal)
        item.setTitleColor(selectedTitleColor, for: UIControlState.selected)
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
