//
//  ZHTabBar.swift
//  ZHTabBar
//
//  Created by Sunny on 15/4/18.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

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
    
    fileprivate var currentItem: ZHBarItem?
    
    init(height: CGFloat) {
        super.init(frame: CGRect(x: 0, y: SCREEN_HEIGHT-height, width: SCREEN_WIDTH, height: height))
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(item item:ZHItemData,
                 titleColor: UIColor,
                 selectedTitleColor: UIColor) {
        
        let barItem = ZHBarItem(item: item)
        addSubview(barItem)
        
        barItem.setTitleColor(titleColor, for: UIControlState.normal)
        barItem.setTitleColor(selectedTitleColor, for: UIControlState.selected)
        barItem.addTarget(self, action: #selector(ZHTabBar.itemClick(_:)), for: UIControlEvents.touchDown)
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
        currentItem = item
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
            let item = subviews[i] 
            item.tag = i
            item.frame = CGRect(x: CGFloat(i) * itemWidth, y: 0, width: itemWidth, height: itemHeight)
        }
    }
}
