//
//  DashboardPresenter.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

final class DashboardPresenter {
    weak var view: DashboardViewProtocol?
}

extension DashboardPresenter: DashboardPresenterProtocol {
    func viewDidLoad() {
        view?.setViewTitle("dashboard_title".localized)
        view?.refresh()
    }
    
    func numberOfMoneyAccounts() -> Int {
        return MoneyAccount.allCases.count
    }
    
    func numberOfTransactionsPerMoneyAccount() -> Int {
        return 0
    }
    
    func fill(header: DashboardHeaderRepresentable, moneyAccount: MoneyAccount) {
        header.display(account: moneyAccount.description.localized, balance: "300€")
    }
}
