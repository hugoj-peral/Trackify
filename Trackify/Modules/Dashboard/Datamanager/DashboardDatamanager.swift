//
//  DashboardDatamanager.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

class DashboardDatamanager {
    let generator = DashboardRandomGenerator()
}

extension DashboardDatamanager: DashboardDatamanagerProtocol {
    func fetchDashboard(completion: @escaping (Dashboard) -> Void) {
        completion(generator.makeRandomDashboard())
    }
}
