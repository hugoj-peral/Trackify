//
//  TransactionMapper.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

class TransactionMapper {
    func map(_ transactionMO: TransactionMO, with transaction: Transaction, account: AccountMO, categories: [CategoryMO]) {
        transactionMO.id = transaction.id
        transactionMO.date = transaction.date
        transactionMO.amount = transaction.amount
        let categoryMO = categories.filter { (category) -> Bool in
            category.id == transaction.category.id
        }.first
        transactionMO.category = categoryMO
        transactionMO.account = account
    }
    
    func map(_ transactionMO: TransactionMO) -> Transaction {
        return Transaction(id: transactionMO.id!,
                           category: CategoryMapper().map(transactionMO.category!),
                           date: transactionMO.date!,
                           amount: transactionMO.amount)
    }
}
