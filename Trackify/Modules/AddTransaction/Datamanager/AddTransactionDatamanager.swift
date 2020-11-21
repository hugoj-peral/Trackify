//
//  AddTransactionDatamanager.swift
//  Trackify
//
//  Created by Hugo Peral on 21/11/2020.
//

import Foundation
import CoreData

class AddTransactionDatamanager {
    let coreDataStack: CoreDataProvider
    
    var accounts: [AccountMO]!
    var categories: [CategoryMO]!
    
    init(coreDataStack: CoreDataProvider) {
        self.coreDataStack = coreDataStack
    }
    
    func map(accounts: [AccountMO]) -> [Account] {
        let mapper = AccountMapper()
        return accounts.map { mapper.map($0, fullMapping: false) }
    }
    
    func map(categories: [CategoryMO]) -> [Category] {
        let mapper = CategoryMapper()
        return categories.map { mapper.map($0) }
    }
}

extension AddTransactionDatamanager: AddTransactionDatamanagerProtocol {
    func fetchAccountsAndCategories(completion: @escaping ((accounts: [Account], categories: [Category])) -> Void) {
        coreDataStack.asynchronousFetch(entityName: "AccountMO") { [weak self] (result: NSAsynchronousFetchResult! ) -> Void in
            self?.accounts = result.finalResult as! [AccountMO]
            guard let strongSelf = self else { return }
            let accounts = strongSelf.map(accounts: strongSelf.accounts)
            
            self?.coreDataStack.asynchronousFetch(entityName: "CategoryMO") { [weak self] (result: NSAsynchronousFetchResult! ) -> Void in
                self?.categories = result.finalResult as! [CategoryMO]
                guard let strongSelf = self else { return }
                let categories = strongSelf.map(categories: strongSelf.categories)
                completion((accounts, categories))
            }
        }
    }
    
    func store(transaction: Transaction, in account: Account, completion: @escaping () -> Void) {
        let mapper = TransactionMapper()
        let transactionMO = NSEntityDescription.insertNewObject(forEntityName: "TransactionMO", into: coreDataStack.persistentContainer.viewContext) as! TransactionMO
        guard let accountMO = accounts.first(where: { (accountMO) -> Bool in
            return accountMO.id == account.id
        }) else { return }
        mapper.map(transactionMO, with: transaction, account: accountMO, categories: categories)
        coreDataStack.saveContext()
        completion()
    }
}
