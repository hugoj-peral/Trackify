//
//  DashboardInteractorProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

// sourcery: AutoMockable
protocol DashboardInteractorInputProtocol: AnyObject {
    func loadDashboard()
}

// sourcery: AutoMockable
protocol DashboardInteractorOutputProtocol: AnyObject {
    func loaded(dashboard: Dashboard)
}
