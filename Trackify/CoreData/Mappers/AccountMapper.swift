//
//  AccountMapper.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

class AccountMapper {
    func map(_ accountMO: AccountMO, with account: Account) {
        accountMO.id = account.id
        accountMO.name = account.name
    }
    
    func map(_ accountMO: AccountMO) -> Account {
        let mapper = TransactionMapper()
        let transactions = accountMO.transactions!.map({ mapper.map($0 as! TransactionMO) }).sorted { $0.date > $1.date }
        
        return Account(id: accountMO.id!,
                       name: accountMO.name!,
                       transactions: transactions,
                       balance: transactions.map({ $0.amount }).reduce(0, +) )
    }
}
