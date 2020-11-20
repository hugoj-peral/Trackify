// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

@testable import Trackify














class DashboardCellRepresentableMock: DashboardCellRepresentable {

    //MARK: - display

    var displayCategoryDateAmountPositiveCallsCount = 0
    var displayCategoryDateAmountPositiveCalled: Bool {
        return displayCategoryDateAmountPositiveCallsCount > 0
    }
    var displayCategoryDateAmountPositiveReceivedArguments: (category: String, date: String, amount: String, positive: Bool)?
    var displayCategoryDateAmountPositiveReceivedInvocations: [(category: String, date: String, amount: String, positive: Bool)] = []
    var displayCategoryDateAmountPositiveClosure: ((String, String, String, Bool) -> Void)?

    func display(category: String, date: String, amount: String, positive: Bool) {
        displayCategoryDateAmountPositiveCallsCount += 1
        displayCategoryDateAmountPositiveReceivedArguments = (category: category, date: date, amount: amount, positive: positive)
        displayCategoryDateAmountPositiveReceivedInvocations.append((category: category, date: date, amount: amount, positive: positive))
        displayCategoryDateAmountPositiveClosure?(category, date, amount, positive)
    }

}
class DashboardHeaderRepresentableMock: DashboardHeaderRepresentable {

    //MARK: - display

    var displayAccountBalanceCallsCount = 0
    var displayAccountBalanceCalled: Bool {
        return displayAccountBalanceCallsCount > 0
    }
    var displayAccountBalanceReceivedArguments: (account: String, balance: String)?
    var displayAccountBalanceReceivedInvocations: [(account: String, balance: String)] = []
    var displayAccountBalanceClosure: ((String, String) -> Void)?

    func display(account: String, balance: String) {
        displayAccountBalanceCallsCount += 1
        displayAccountBalanceReceivedArguments = (account: account, balance: balance)
        displayAccountBalanceReceivedInvocations.append((account: account, balance: balance))
        displayAccountBalanceClosure?(account, balance)
    }

}
class DashboardInteractorInputProtocolMock: DashboardInteractorInputProtocol {

    //MARK: - loadDashboard

    var loadDashboardCallsCount = 0
    var loadDashboardCalled: Bool {
        return loadDashboardCallsCount > 0
    }
    var loadDashboardClosure: (() -> Void)?

    func loadDashboard() {
        loadDashboardCallsCount += 1
        loadDashboardClosure?()
    }

}
class DashboardInteractorOutputProtocolMock: DashboardInteractorOutputProtocol {

    //MARK: - loaded

    var loadedCallsCount = 0
    var loadedCalled: Bool {
        return loadedCallsCount > 0
    }
    var loadedClosure: (() -> Void)?

    func loaded() {
        loadedCallsCount += 1
        loadedClosure?()
    }

}
class DashboardPresenterProtocolMock: DashboardPresenterProtocol {

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - numberOfMoneyAccounts

    var numberOfMoneyAccountsCallsCount = 0
    var numberOfMoneyAccountsCalled: Bool {
        return numberOfMoneyAccountsCallsCount > 0
    }
    var numberOfMoneyAccountsReturnValue: Int!
    var numberOfMoneyAccountsClosure: (() -> Int)?

    func numberOfMoneyAccounts() -> Int {
        numberOfMoneyAccountsCallsCount += 1
        return numberOfMoneyAccountsClosure.map({ $0() }) ?? numberOfMoneyAccountsReturnValue
    }

    //MARK: - numberOfTransactionsPerMoneyAccount

    var numberOfTransactionsPerMoneyAccountCallsCount = 0
    var numberOfTransactionsPerMoneyAccountCalled: Bool {
        return numberOfTransactionsPerMoneyAccountCallsCount > 0
    }
    var numberOfTransactionsPerMoneyAccountReturnValue: Int!
    var numberOfTransactionsPerMoneyAccountClosure: (() -> Int)?

    func numberOfTransactionsPerMoneyAccount() -> Int {
        numberOfTransactionsPerMoneyAccountCallsCount += 1
        return numberOfTransactionsPerMoneyAccountClosure.map({ $0() }) ?? numberOfTransactionsPerMoneyAccountReturnValue
    }

    //MARK: - fill

    var fillHeaderSectionCallsCount = 0
    var fillHeaderSectionCalled: Bool {
        return fillHeaderSectionCallsCount > 0
    }
    var fillHeaderSectionReceivedArguments: (header: DashboardHeaderRepresentable, section: Int)?
    var fillHeaderSectionReceivedInvocations: [(header: DashboardHeaderRepresentable, section: Int)] = []
    var fillHeaderSectionClosure: ((DashboardHeaderRepresentable, Int) -> Void)?

    func fill(header: DashboardHeaderRepresentable, section: Int) {
        fillHeaderSectionCallsCount += 1
        fillHeaderSectionReceivedArguments = (header: header, section: section)
        fillHeaderSectionReceivedInvocations.append((header: header, section: section))
        fillHeaderSectionClosure?(header, section)
    }

    //MARK: - fill

    var fillCellSectionRowCallsCount = 0
    var fillCellSectionRowCalled: Bool {
        return fillCellSectionRowCallsCount > 0
    }
    var fillCellSectionRowReceivedArguments: (cell: DashboardCellRepresentable, section: Int, row: Int)?
    var fillCellSectionRowReceivedInvocations: [(cell: DashboardCellRepresentable, section: Int, row: Int)] = []
    var fillCellSectionRowClosure: ((DashboardCellRepresentable, Int, Int) -> Void)?

    func fill(cell: DashboardCellRepresentable, section: Int, row: Int) {
        fillCellSectionRowCallsCount += 1
        fillCellSectionRowReceivedArguments = (cell: cell, section: section, row: row)
        fillCellSectionRowReceivedInvocations.append((cell: cell, section: section, row: row))
        fillCellSectionRowClosure?(cell, section, row)
    }

    //MARK: - addTransactionAction

    var addTransactionActionCallsCount = 0
    var addTransactionActionCalled: Bool {
        return addTransactionActionCallsCount > 0
    }
    var addTransactionActionClosure: (() -> Void)?

    func addTransactionAction() {
        addTransactionActionCallsCount += 1
        addTransactionActionClosure?()
    }

}
class DashboardRouterProtocolMock: DashboardRouterProtocol {

    //MARK: - routeToAddTransaction

    var routeToAddTransactionCallsCount = 0
    var routeToAddTransactionCalled: Bool {
        return routeToAddTransactionCallsCount > 0
    }
    var routeToAddTransactionClosure: (() -> Void)?

    func routeToAddTransaction() {
        routeToAddTransactionCallsCount += 1
        routeToAddTransactionClosure?()
    }

}
class DashboardViewProtocolMock: DashboardViewProtocol {

    //MARK: - refresh

    var refreshCallsCount = 0
    var refreshCalled: Bool {
        return refreshCallsCount > 0
    }
    var refreshClosure: (() -> Void)?

    func refresh() {
        refreshCallsCount += 1
        refreshClosure?()
    }

    //MARK: - setViewTitle

    var setViewTitleCallsCount = 0
    var setViewTitleCalled: Bool {
        return setViewTitleCallsCount > 0
    }
    var setViewTitleReceivedTitle: String?
    var setViewTitleReceivedInvocations: [String] = []
    var setViewTitleClosure: ((String) -> Void)?

    func setViewTitle(_ title: String) {
        setViewTitleCallsCount += 1
        setViewTitleReceivedTitle = title
        setViewTitleReceivedInvocations.append(title)
        setViewTitleClosure?(title)
    }

}
