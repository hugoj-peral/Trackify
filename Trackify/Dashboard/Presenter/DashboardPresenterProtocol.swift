//
//  DashboardPresenterProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

// sourcery: AutoMockable
protocol DashboardPresenterProtocol: AnyObject {
    func viewDidLoad()
    func numberOfMoneyAccounts() -> Int
    func numberOfTransactionsPerMoneyAccount() -> Int
}
