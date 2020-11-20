//
//  DashboardViewControllerTest.swift
//  TrackifyTests
//
//  Created by Hugo Peral on 19/11/2020.
//

import XCTest
@testable import Trackify

class DashboardViewControllerTest: XCTestCase {
    
    var sut: DashboardViewController!
    var presenter: DashboardPresenterProtocolMock!

    override func setUpWithError() throws {
        presenter = DashboardPresenterProtocolMock()
        sut = DashboardViewController(presenter: presenter)
    }

    override func tearDownWithError() throws {
        presenter = nil
        sut = nil
    }
    
    func testSetViewTitle_SetTitle() {
        let title = "ABC"
        sut.setViewTitle(title)
        XCTAssert(sut.title == title)
    }

    func testRefresh_ReloadData() {
        let tableView = TableViewMock()
        sut.tableView = tableView
        
        sut.refresh()
        
        XCTAssert(tableView.reloadDataCalled)
    }
    
    func testNumberOfSections_NumberOfMoneyAccounts() {
        let numberOfSections = 10
        presenter.numberOfMoneyAccountsReturnValue = numberOfSections
        
        let result = sut.numberOfSections(in: TableViewMock())
        
        XCTAssert(result == numberOfSections)
        XCTAssert(presenter.numberOfMoneyAccountsCalled)
    }
    
    func testNumberOfRowsInSection_NumberOfTransactionsPerMoneyAccount() {
        let numberOfRows = 26
        presenter.numberOfTransactionsPerMoneyAccountReturnValue = numberOfRows
        
        let result = sut.tableView(TableViewMock(), numberOfRowsInSection: 0)
        
        XCTAssert(result == numberOfRows)
        XCTAssert(presenter.numberOfTransactionsPerMoneyAccountCalled)
    }
    
    func testViewDidLoad_ViewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssert(presenter.viewDidLoadCalled)
    }
    
    func testAddTapped_AddTransactionAction() {
        sut.addTapped(UIButton())
        
        XCTAssert(presenter.addTransactionActionCalled)
    }
}
