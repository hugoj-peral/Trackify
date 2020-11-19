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
        return 0
    }
    
    func numberOfTransactionsPerMoneyAccount() -> Int {
        return 0
    }
}
