//
//  CategoryMapper.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

class CategoryMapper {
    func map(_ categoryMO: CategoryMO, with category: Category) {
        categoryMO.id = category.id
        categoryMO.name = category.name
        categoryMO.type = category.type.rawValue
    }
    
    func map(_ categoryMO: CategoryMO) -> Category {
        return Category(id: categoryMO.id!, name: categoryMO.name!, type: CategoryType(rawValue: categoryMO.type!)!)
    }
}
