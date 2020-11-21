//
//  AddTransactionDatamanagerProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 21/11/2020.
//

import Foundation

// sourcery: AutoMockable
protocol AddTransactionDatamanagerProtocol: AnyObject {
    func fetchAccountsAndCategories(completion: @escaping ((accounts: [Account], categories: [Category])) -> Void)
    func store(transaction: Transaction, in account: Account, completion: @escaping () -> Void)
}
