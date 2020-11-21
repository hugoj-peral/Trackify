//
//  DashboardPresenter.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

final class DashboardPresenter {
    weak var view: DashboardViewProtocol?
    var dashboard: Dashboard = Dashboard(accounts: [])
    let router: DashboardRouterProtocol
    let interactor: DashboardInteractorInputProtocol
    let dateFormatter = DateFormatter.makeDateFormatter()
    let numberFormatter = NumberFormatter.makeNumberFormatter()
    
    init(router: DashboardRouterProtocol, interactor: DashboardInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension DashboardPresenter: DashboardPresenterProtocol {
    func viewDidLoad() {
        view?.setViewTitle("dashboard_title".localized)
        interactor.loadDashboard()
    }
    
    func refreshData() {
        interactor.loadDashboard()
    }
    
    func numberOfMoneyAccounts() -> Int {
        return dashboard.accounts.count
    }
    
    func numberOfTransactionsPerMoneyAccount(section: Int) -> Int {
        return dashboard.accounts[section].transactions.count
    }
    
    func fill(header: DashboardHeaderRepresentable, section: Int) {
        let account = dashboard.accounts[section]
        header.display(account: account.name, balance: numberFormatter.string(for: account.balance)!)
    }
    
    func fill(cell: DashboardCellRepresentable, section: Int, row: Int) {
        let transaction = dashboard.accounts[section].transactions[row]
        let category = transaction.category
        cell.display(category: category.name, date: dateFormatter.string(from: transaction.date), amount: numberFormatter.string(for: transaction.amount)!, type: category.type)
    }
    
    func addTransactionAction() {
        router.routeToAddTransaction()
    }
}

extension DashboardPresenter: DashboardInteractorOutputProtocol {
    func loaded(dashboard: Dashboard) {
        self.dashboard = dashboard
        view?.refresh()
    }
}
