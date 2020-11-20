//
//  Category.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

enum CategoryType: String {
    case income, expense
}

struct Category {
    let id: UUID
    let name: String
    let type: CategoryType
}
