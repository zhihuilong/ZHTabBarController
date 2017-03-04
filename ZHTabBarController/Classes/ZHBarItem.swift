//
//  ZHBarItem.swift
//  ZHTabbar
//
//  Created by Sunny on 15/4/18.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

public final class ZHBarItem: UIButton {
    
    public override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {}
    }
    
    fileprivate let item: ZHItemData
    fileprivate let imageRatio: CGFloat = 0.65
    fileprivate let imageSize = CGSize(width: 30, height: 25) // According to https://developer.apple.com/ios/human-interface-guidelines/graphics/custom-icons/ @1x : about 25 x 25 (max: 48 x 32)
    
    init(item: ZHItemData) {
        self.item = item
        super.init(frame: CGRect(origin: CGPoint.zero, size: imageSize))
        
        setImage(UIImage(named: item.icon), for: UIControlState())
        setImage(UIImage(named: item.selectedIcon), for: UIControlState.selected)
        setTitle(item.title, for: UIControlState())
        
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.font = UIFont.systemFont(ofSize: 11)
        titleLabel?.numberOfLines = 0
        titleLabel?.sizeToFit()
        
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        adjustsImageWhenHighlighted = false
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if item.title != nil {
            let titleY = contentRect.size.height * imageRatio
            let titleHeight = contentRect.size.height - titleY
            return CGRect(x: 0, y: titleY, width: contentRect.size.width, height: titleHeight)
        } else {
            return CGRect.zero
        }
    }
    
    public override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if item.title != nil {
            let y = contentRect.size.height * imageRatio/5.0
            return CGRect(x: 0, y: y+2, width: contentRect.size.width, height: contentRect.size.height * imageRatio - y*2 )
        } else {
            return CGRect(x: 0, y: contentRect.size.height/4, width: contentRect.size.width, height: contentRect.size.height/2)
        }
    }

}
