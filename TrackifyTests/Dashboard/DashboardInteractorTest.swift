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
    
    func testPorcessDashboard_Loaded() {
        sut.processDashboard(dashboard: DashboardRandomGenerator().makeRandomDashboard())
        
        XCTAssert(presenter.loadedDashboardCalled)
    }
    
    func testLoadDashboard_FetchDashboard() {
        sut.loadDashboard()
        
        XCTAssert(datamanager.fetchDashboardCompletionCalled)
    }
}
