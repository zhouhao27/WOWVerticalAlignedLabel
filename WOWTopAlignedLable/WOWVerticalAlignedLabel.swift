//
//  WOWVerticalAlignedLabel.swift
//  WOWTopAlignedLable
//
//  Created by Zhou Hao on 25/8/15.
//  Copyright © 2015 Zhou Hao. All rights reserved.
//

import UIKit

@IBDesignable public class WOWVerticalAlignedLabel: UILabel {
    
    static let kVerticalAlignedTop = "Vertical top aligned"
    static let kVerticalAlignedMiddle = "Vertical middle aligned"
    static let kVerticalAlignedBottom = "Vertical bottom aligned"
    
    // since @IBInspectable doesn't support enum so that I use a Int
    public enum VerticalAlignment : Int {
        case top = 0
        case middle = 1
        case bottom = 2
    }
    
    var verticalAlignment : VerticalAlignment = VerticalAlignment.middle
    
    @IBInspectable public var verticalAlignmentInt : Int = 0 {
        didSet {
            verticalAlignment = VerticalAlignment(rawValue: verticalAlignmentInt)!
        }
    }
    
//    @IBInspectable public var verticalAlignmentString :String = WOWVerticalAlignedLabel.kVerticalAlignedMiddle {
//        didSet {
//          
//            if verticalAlignmentString == WOWVerticalAlignedLabel.kVerticalAlignedMiddle {
//                verticalAlignment = .middle
//            } else if verticalAlignmentString == WOWVerticalAlignedLabel.kVerticalAlignedTop {
//                verticalAlignment = .top
//            } else if verticalAlignmentString == WOWVerticalAlignedLabel.kVerticalAlignedBottom {
//                verticalAlignment = .bottom
//            }
//        }
//    }
    
    @IBInspectable public var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    override public func drawTextInRect(rect: CGRect) {
        
        if let stringText = text {
            
            let stringTextAsNSString = stringText as NSString
            let labelStringSize = stringTextAsNSString.boundingRectWithSize(CGSizeMake(CGRectGetWidth(self.frame), CGFloat.max),
                options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                attributes: [NSFontAttributeName: font],
                context: nil).size
            
            switch verticalAlignment {
            case .top:
                super.drawTextInRect(CGRectMake(0, 0, CGRectGetWidth(self.frame), ceil(labelStringSize.height)))
            case .middle:
                super.drawTextInRect(rect)
            case .bottom:
                super.drawTextInRect(CGRectMake(0, frame.height - ceil(labelStringSize.height), CGRectGetWidth(self.frame), ceil(labelStringSize.height)))
            }

        } else {
            super.drawTextInRect(rect)
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}