//
//  DashboardDatamanager.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation
import CoreData

class DashboardDatamanager {
    let coreDataStack: CoreDataProvider
    
    init(coreDataStack: CoreDataProvider) {
        self.coreDataStack = coreDataStack
    }
    
    func map(accounts: [AccountMO]) -> [Account] {
        let mapper = AccountMapper()
        return accounts.map { mapper.map($0, fullMapping: true) }
    }
}

extension DashboardDatamanager: DashboardDatamanagerProtocol {
    func fetchAccounts(completion: @escaping ([Account]) -> Void) {
        
        coreDataStack.asynchronousFetch(entityName: "AccountMO") { [weak self] (result: NSAsynchronousFetchResult! ) -> Void in
            if let accounts = self?.map(accounts: result.finalResult as! [AccountMO]) {
                completion(accounts)
            } else {
                completion([])
            }
        }
    }
}
