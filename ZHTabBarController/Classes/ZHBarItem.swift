//
//  ZHBarItem.swift
//  ZHTabbar
//
//  Created by Sunny on 15/4/18.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

class ZHBarItem: UIButton {
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.font = ZHBarFont
        titleLabel?.numberOfLines = 0
        titleLabel?.sizeToFit()
        setTitleColor(ZHBarTitleColor, for: UIControlState())
        setTitleColor(ZHBarSelectedColor, for: UIControlState.selected)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        adjustsImageWhenHighlighted = false
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if ZHHasTitle {
            let titleY = contentRect.size.height * ZHImageRatio 
            let titleHeight = contentRect.size.height - titleY
            return CGRect(x: 0, y: titleY, width: contentRect.size.width, height: titleHeight)
        } else {
            return CGRect.zero
        }
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if ZHHasTitle {
            let y = contentRect.size.height * ZHImageRatio/5
            return CGRect(x: 0, y: y+2, width: contentRect.size.width, height: contentRect.size.height * ZHImageRatio - y*2 )
        } else {
            return CGRect(x: 0, y: contentRect.size.height/4, width: contentRect.size.width, height: contentRect.size.height/2)
        }
    }

}
