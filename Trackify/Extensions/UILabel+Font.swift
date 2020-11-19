//
//  UILabel+Font.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

extension UILabel {
    static func makeTitle(textAlignment: NSTextAlignment = .left) -> UILabel {
       return makeLabel(textAlignment: textAlignment, font: .boldSystemFont(ofSize: 17))
    }
    
    static func makeSubTitle(textAlignment: NSTextAlignment = .left) -> UILabel {
       return makeLabel(textAlignment: textAlignment, font: .systemFont(ofSize: 13))
    }
    
    static func makeLabel(textAlignment: NSTextAlignment, font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textAlignment = textAlignment
        label.textColor = .black
        return label
    }
}
