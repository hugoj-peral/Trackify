//
//  DashboardInteractor.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

class DashboardInteractor {
    weak var presenter: DashboardInteractorOutputProtocol?
    let datamanager: DashboardDatamanagerProtocol
    
    init(datamanager: DashboardDatamanagerProtocol) {
        self.datamanager = datamanager
    }
    
    func processDashboard(dashboard: Dashboard) {
        presenter?.loaded(dashboard: dashboard)
    }
}

extension DashboardInteractor: DashboardInteractorInputProtocol {
    func loadDashboard() {
        datamanager.fetchDashboard { [weak self] (dashboard) in
            self?.processDashboard(dashboard: dashboard)
        }
    }
}
