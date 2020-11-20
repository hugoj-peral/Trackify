//
//  DashboardInteractor.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

class DashboardInteractor {
    let maximumNumberOfTransactions = 10
    weak var presenter: DashboardInteractorOutputProtocol?
    let datamanager: DashboardDatamanagerProtocol
    
    init(datamanager: DashboardDatamanagerProtocol) {
        self.datamanager = datamanager
    }
    
    func processAccounts(accounts: [Account]) {
        var dashboardAccounts: [Account] = []
        accounts.forEach {
            dashboardAccounts.append(Account(id: $0.id,
                                    name: $0.name,
                                    transactions: Array($0.transactions.prefix(maximumNumberOfTransactions)),
                                    balance: $0.balance))
        }
        
        presenter?.loaded(dashboard: Dashboard(accounts: dashboardAccounts))
    }
}

extension DashboardInteractor: DashboardInteractorInputProtocol {
    func loadDashboard() {
        datamanager.fetchAccounts { [weak self] (accounts) in
            self?.processAccounts(accounts: accounts)
        }
    }
}
