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
        sut.dashboard = Dashboard(accounts: [Account(id: UUID(), name: "Cash", transactions: [Transaction(id: UUID(), category: Category(id: UUID(), name: "Salary", type: .income), date: Date(), amount: 100.0)], balance: 100.0)])
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

    func testViewDidLoad_LoadDashboard() {
        sut.viewDidLoad()
        
        XCTAssert(interactor.loadDashboardCalled)
    }
    
    func testNumberOfMoneyAccounts() {
        XCTAssert(sut.numberOfMoneyAccounts() == 1)
    }
    
    func testNumberOfTransactionsPerMoneyAccount() {
        XCTAssert(sut.numberOfTransactionsPerMoneyAccount(section: 0) == 1)
    }
    
    func testFillHeader() {
        let header = DashboardHeaderRepresentableMock()
        
        sut.fill(header: header, section: 0)
        
        XCTAssert(header.displayAccountBalanceCalled)
    }
    
    func testFillCell() {
        let cell = DashboardCellRepresentableMock()
        
        sut.fill(cell: cell, section: 0, row: 0)
        
        XCTAssert(cell.displayCategoryDateAmountTypeCalled)
    }
    
    func testAddTransactionAction_RouteToAddTransaction() {
        sut.addTransactionAction()
        
        XCTAssert(router.routeToAddTransactionCalled)
    }
    
    func testLoaded_Refresh() {
        sut.loaded(dashboard: Dashboard(accounts: []))
        
        XCTAssert(view.refreshCalled)
    }
}
