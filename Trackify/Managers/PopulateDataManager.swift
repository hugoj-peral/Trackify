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
        return categories.map ({
            let categoryMO = NSEntityDescription.insertNewObject(forEntityName: "CategoryMO", into: coreDataStack.persistentContainer.viewContext) as! CategoryMO
            categoryMO.id = $0.id
            categoryMO.name = $0.name
            categoryMO.type = $0.type.description
            return categoryMO
        })
    }
    
    @discardableResult
    private func insertAccounts(accounts: [Account]) -> [AccountMO] {
        return accounts.map ({
            let accountMO = NSEntityDescription.insertNewObject(forEntityName: "AccountMO", into: coreDataStack.persistentContainer.viewContext) as! AccountMO
            accountMO.id = $0.id
            accountMO.name = $0.name
            return accountMO
        })
    }
    
    @discardableResult
    private  func insertTransactions(transactions: [Transaction], accounts: [AccountMO], categories: [CategoryMO]) -> [TransactionMO] {
        return transactions.map ({
            let transactionMO = NSEntityDescription.insertNewObject(forEntityName: "TransactionMO", into: coreDataStack.persistentContainer.viewContext) as! TransactionMO
            transactionMO.id = $0.id
            transactionMO.date = $0.date
            transactionMO.amount = $0.amount
            let categoryId = $0.category.id
            let categoryMO = categories.filter { (category) -> Bool in
                category.id == categoryId
            }.first
            transactionMO.category = categoryMO
            transactionMO.account = accounts.randomElement()
            return transactionMO
        })
    }
}
