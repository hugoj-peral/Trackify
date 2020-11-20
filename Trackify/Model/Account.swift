//
//  Account.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

struct Account {
    let id: UInt
    let name: String
    let transactions: [Transaction]
    let balance: Double
}
