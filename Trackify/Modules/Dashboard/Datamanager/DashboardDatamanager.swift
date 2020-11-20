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
        return accounts.map { mapper.map($0) }
    }
}

extension DashboardDatamanager: DashboardDatamanagerProtocol {
    func fetchAccounts(completion: @escaping ([Account]) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AccountMO")
        let asyncFetchRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { [weak self] (result: NSAsynchronousFetchResult! ) -> Void in
            if let accounts = self?.map(accounts: result.finalResult as! [AccountMO]) {
                completion(accounts)
            } else {
                completion([])
            }
        }
        do {
            try coreDataStack.persistentContainer.viewContext.execute(asyncFetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            completion([])
        }
    }
}
