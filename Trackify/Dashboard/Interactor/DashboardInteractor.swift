//
//  DashboardInteractor.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

class DashboardInteractor {
    weak var presenter: DashboardInteractorOutputProtocol?
}

extension DashboardInteractor: DashboardInteractorInputProtocol {
    func loadDashboard() {
        presenter?.loaded()
    }
}
