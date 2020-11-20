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
    var router: DashboardRouterProtocolMock!
    var interactor: DashboardInteractorInputProtocolMock!

    override func setUpWithError() throws {
        router = DashboardRouterProtocolMock()
        interactor = DashboardInteractorInputProtocolMock()
        sut = DashboardPresenter(router: router, interactor: interactor)
        view = DashboardViewProtocolMock()
        sut.view = view
    }

    override func tearDownWithError() throws {
        view = nil
        router = nil
        interactor = nil
        sut = nil
    }


    func testViewDidLoad_SetTitle() {
        sut.viewDidLoad()
        
        XCTAssert(view.setViewTitleCalled)
        XCTAssert(view.setViewTitleReceivedTitle == "dashboard_title".localized)
    }

    func testViewDidLoad_Refresh() {
        sut.viewDidLoad()
        
        XCTAssert(interactor.loadDashboardCalled)
    }
    
    func testNumberOfMoneyAccounts() {
        XCTAssert(sut.numberOfMoneyAccounts() == 3)
    }
    
    func testNumberOfTransactionsPerMoneyAccount() {
        XCTAssert(sut.numberOfTransactionsPerMoneyAccount() == 10)
    }
    
    func testFillHeader() {
        let header = DashboardHeaderRepresentableMock()
        
        sut.fill(header: header, section: 0)
        
        XCTAssert(header.displayAccountBalanceCalled)
    }
    
    func testFillCell() {
        let cell = DashboardCellRepresentableMock()
        
        sut.fill(cell: cell, section: 0, row: 0)
        
        XCTAssert(cell.displayCategoryDateAmountPositiveCalled)
    }
    
    func testAddTransactionAction_RouteToAddTransaction() {
        sut.addTransactionAction()
        
        XCTAssert(router.routeToAddTransactionCalled)
    }
    
    func testLoaded_Refresh() {
        sut.loaded()
        
        XCTAssert(view.refreshCalled)
    }
}
