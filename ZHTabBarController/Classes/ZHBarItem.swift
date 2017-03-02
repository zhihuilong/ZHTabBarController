//
//  ZHBarItem.swift
//  ZHTabbar
//
//  Created by Sunny on 15/4/18.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

let ZHBarFont              = UIFont.systemFont(ofSize: 11)
let ZHBarBackColor         = UIColor.kColor(19, green: 22, blue: 23)

public final class ZHBarItem: UIButton {
    
    public var hasTitle: Bool = true
    
    public override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {}
    }
    
    fileprivate let imageRatio: CGFloat = 0.65
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.font = ZHBarFont
        titleLabel?.numberOfLines = 0
        titleLabel?.sizeToFit()
        
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        adjustsImageWhenHighlighted = false
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if hasTitle {
            let titleY = contentRect.size.height * imageRatio
            let titleHeight = contentRect.size.height - titleY
            return CGRect(x: 0, y: titleY, width: contentRect.size.width, height: titleHeight)
        } else {
            return CGRect.zero
        }
    }
    
    public override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if hasTitle {
            let y = contentRect.size.height * imageRatio/5.0
            return CGRect(x: 0, y: y+2, width: contentRect.size.width, height: contentRect.size.height * imageRatio - y*2 )
        } else {
            return CGRect(x: 0, y: contentRect.size.height/4, width: contentRect.size.width, height: contentRect.size.height/2)
        }
    }

}
