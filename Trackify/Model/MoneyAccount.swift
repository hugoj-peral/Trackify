//
//  MoneyAccount.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

enum MoneyAccount: CaseIterable {
    case cash, creditCard, bankAccount
}

extension MoneyAccount: CustomStringConvertible {
    var description: String {
        switch self {
        case .cash:
            return "cash"
        case .creditCard:
            return "credit card"
        case .bankAccount:
            return "bank account"
        }
    }
}
