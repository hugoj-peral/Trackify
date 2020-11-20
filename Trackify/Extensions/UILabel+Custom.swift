//
//  UILabel+Custom.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

extension UILabel {
    class func makeTitle(textAlignment: NSTextAlignment = .left) -> UILabel {
       return makeLabel(textAlignment: textAlignment, font: .boldSystemFont(ofSize: 17))
    }
    
    class func makeSubTitle(textAlignment: NSTextAlignment = .left) -> UILabel {
       return makeLabel(textAlignment: textAlignment, font: .systemFont(ofSize: 13))
    }
    
    class func makeLabel(textAlignment: NSTextAlignment, font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textAlignment = textAlignment
        label.textColor = .black
        return label
    }
}
