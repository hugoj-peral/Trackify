//
//  DashboardRouter.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

class DashboardRouter {
    weak var view: NavigableView?
}

extension DashboardRouter: DashboardRouterProtocol {
    func routeToAddTransaction() {
        print("Add new transaction")
    }
}
