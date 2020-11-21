//
//  DashboardRouter.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

class DashboardRouter {
    weak var view: NavigableView?
    weak var presenter: DashboardPresenterProtocol?
}

extension DashboardRouter: DashboardRouterProtocol {
    func routeToAddTransaction() {
        let addTransactionView: AddTransactionViewController = AppAssembler().resolve { [weak self] in
            self?.presenter?.refreshData()
        }
        view?.presentEmbebed(view: addTransactionView)
    }
}
