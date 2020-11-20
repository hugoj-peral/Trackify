//
//  DashboardInteractorTest.swift
//  TrackifyTests
//
//  Created by Hugo Peral on 20/11/2020.
//

import XCTest
@testable import Trackify

class DashboardInteractorTest: XCTestCase {

    var sut: DashboardInteractor!
    var presenter: DashboardInteractorOutputProtocolMock!
    var datamanager: DashboardDatamanagerProtocolMock!
    
    override func setUpWithError() throws {
        datamanager = DashboardDatamanagerProtocolMock()
        sut = DashboardInteractor(datamanager: datamanager)
        presenter = DashboardInteractorOutputProtocolMock()
        sut.presenter = presenter
    }

    override func tearDownWithError() throws {
        presenter = nil
        datamanager = nil
        sut = nil
    }
    
    func testPorcessAccounts_Loaded() {
        sut.processAccounts(accounts: DashboardRandomGenerator().makeRandomDashboard().accounts)
        
        XCTAssert(presenter.loadedDashboardCalled)
    }
    
    func testPorcessAccounts_LessOrEqualToTenTransactions() {
        sut.processAccounts(accounts: DashboardRandomGenerator().makeRandomDashboard().accounts)
        
        XCTAssert(presenter.loadedDashboardCalled)
        guard let dashboard = presenter.loadedDashboardReceivedDashboard else { return }
        XCTAssert(dashboard.accounts.map({$0.transactions}).allSatisfy({$0.count <= 10}))
    }
    
    func testLoadDashboard_FetchDashboard() {
        sut.loadDashboard()
        
        XCTAssert(datamanager.fetchAccountsCompletionCalled)
    }
}
