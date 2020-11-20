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
struct Category {
    let id: UInt
    let name: String
    let type: CategoryType
}
