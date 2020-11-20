//
//  NumberFormatter+Custom.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

extension NumberFormatter {
    class func makeNumberFormatter(locale: Locale = Locale.current) -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: locale.identifier)
        return numberFormatter
    }
}
