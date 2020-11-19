//
//  DashboardPresenterTest.swift
//  TrackifyTests
//
//  Created by Hugo Peral on 19/11/2020.
//

import XCTest
@testable import Trackify

class DashboardPresenterTest: XCTestCase {
    
    var sut: DashboardPresenter!
    var view: DashboardViewProtocolMock!

    override func setUpWithError() throws {
        sut = DashboardPresenter()
        view = DashboardViewProtocolMock()
        sut.view = view
    }

    override func tearDownWithError() throws {
        view = nil
        sut = nil
    }


    func testViewDidLoad_SetTitle() {
        sut.viewDidLoad()
        
        XCTAssert(view.setViewTitleCalled)
        XCTAssert(view.setViewTitleReceivedTitle == "dashboard_title".localized)
    }

    func testViewDidLoad_Refresh() {
        sut.viewDidLoad()
        
        XCTAssert(view.refreshCalled)
    }
    
    func testNumberOfMoneyAccounts() {
        XCTAssert(sut.numberOfMoneyAccounts() == 0)
    }
    
    func testNumberOfTransactionsPerMoneyAccount() {
        XCTAssert(sut.numberOfTransactionsPerMoneyAccount() == 0)
    }
}
