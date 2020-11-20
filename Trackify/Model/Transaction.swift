//
//  Transaction.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

struct Transaction {
    let id: UUID
    let category: Category
    let date: Date
    let amount: Double
}
