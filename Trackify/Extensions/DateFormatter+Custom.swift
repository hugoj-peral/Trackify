//
//  DateFormatter+Custom.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

extension DateFormatter {
    class func makeDateFormatter(locale: Locale = Locale.current) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: locale.identifier)
         
        dateFormatter.doesRelativeDateFormatting = true
        
        return dateFormatter
    }
}
