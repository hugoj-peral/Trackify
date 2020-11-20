//
//  PopulateDataManager.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation
import CoreData

class PopulateDataManager {
    
    let userDefaults: UserDefaultsAccesable
    let dashboarGenerator: DashboardRandomGenerable
    let coreDataStack: CoreDataProvider
    
    init(dashboarGenerator: DashboardRandomGenerable = DashboardRandomGenerator(),
         userDefaults: UserDefaultsAccesable = UserDefaults.standard,
         coreDataStack: CoreDataProvider) {
        self.userDefaults = userDefaults
        self.dashboarGenerator = dashboarGenerator
        self.coreDataStack = coreDataStack
    }
    
    func populateAppIfNeeded() {
        guard userDefaults.isFirstAccess() else { return }
        populateData()
        userDefaults.setFirstAccess()
    }
    
    func populateData() {
        let categories = dashboarGenerator.makeAllCategories()
        insertTransactions(transactions: dashboarGenerator.makeRandomTransactions(categories: categories),
                           accounts: insertAccounts(accounts: dashboarGenerator.makeAllAccounts(transactionDistribution: [:])),
                           categories: insertCategories(categories: categories))
        
        coreDataStack.saveContext()
    }
    
    @discardableResult
    private func insertCategories(categories: [Category]) -> [CategoryMO] {
        let mapper = CategoryMapper()
        return categories.map ({
            let categoryMO = NSEntityDescription.insertNewObject(forEntityName: "CategoryMO", into: coreDataStack.persistentContainer.viewContext) as! CategoryMO
            mapper.map(categoryMO, with: $0)
            return categoryMO
        })
    }
    
    @discardableResult
    private func insertAccounts(accounts: [Account]) -> [AccountMO] {
        let mapper = AccountMapper()
        return accounts.map ({
            let accountMO = NSEntityDescription.insertNewObject(forEntityName: "AccountMO", into: coreDataStack.persistentContainer.viewContext) as! AccountMO
            mapper.map(accountMO, with: $0)
            return accountMO
        })
    }
    
    @discardableResult
    private  func insertTransactions(transactions: [Transaction], accounts: [AccountMO], categories: [CategoryMO]) -> [TransactionMO] {
        let mapper = TransactionMapper()
        return transactions.map ({
            let transactionMO = NSEntityDescription.insertNewObject(forEntityName: "TransactionMO", into: coreDataStack.persistentContainer.viewContext) as! TransactionMO
            mapper.map(transactionMO, with: $0, account: accounts.randomElement()!, categories: categories)
            return transactionMO
        })
    }
}
