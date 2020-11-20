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
    
    override func setUpWithError() throws {
        sut = DashboardInteractor()
        presenter = DashboardInteractorOutputProtocolMock()
        sut.presenter = presenter
    }

    override func tearDownWithError() throws {
        presenter = nil
        sut = nil
    }
    
    func testLoadDashboard_Loaded() {
        sut.loadDashboard()
        
        XCTAssert(presenter.loadedDashboardCalled)
    }
}
