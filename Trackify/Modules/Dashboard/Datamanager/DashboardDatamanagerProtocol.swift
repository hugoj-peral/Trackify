//
//  DashboardDatamanagerProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

// sourcery: AutoMockable
protocol DashboardDatamanagerProtocol: AnyObject {
    func fetchAccounts(completion: @escaping ([Account]) -> Void)
}
