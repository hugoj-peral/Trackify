//
//  DashboardPresenter.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

final class DashboardPresenter {
    weak var view: DashboardViewProtocol?
    var accountsNames: [String] = ["Cash", "Credit Card", "Bank Account"]
}

extension DashboardPresenter: DashboardPresenterProtocol {
    func viewDidLoad() {
        view?.setViewTitle("dashboard_title".localized)
        view?.refresh()
    }
    
    func numberOfMoneyAccounts() -> Int {
        return accountsNames.count
    }
    
    func numberOfTransactionsPerMoneyAccount() -> Int {
        return 10
    }
    
    func fill(header: DashboardHeaderRepresentable, section: Int) {
        header.display(account: accountsNames[section], balance: "300€")
    }
    
    func fill(cell: DashboardCellRepresentable, section: Int, row: Int) {
        cell.display(category: "Home", date: "20/09/2020 at 5:30pm", amount: "-300€", positive: false)
    }
}
