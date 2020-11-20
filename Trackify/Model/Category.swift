//
//  Category.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

enum CategoryType {
    case income, expense
}

extension CategoryType: CustomStringConvertible {
    var description: String {
        switch self {
        case .income:
            return "income"
        case .expense:
            return "expense"
        }
    }
}

struct Category {
    let id: UUID
    let name: String
    let type: CategoryType
}
