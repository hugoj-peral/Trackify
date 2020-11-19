//
//  String+Localized.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
