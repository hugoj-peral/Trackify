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
    func refreshData()
    func numberOfMoneyAccounts() -> Int
    func numberOfTransactionsPerMoneyAccount(section: Int) -> Int
    func fill(header: DashboardHeaderRepresentable, section: Int)
    func fill(cell: DashboardCellRepresentable, section: Int, row: Int)
    func addTransactionAction()
}
