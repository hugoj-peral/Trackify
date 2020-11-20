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
import CoreData

@testable import Trackify














class CoreDataProviderMock: CoreDataProvider {
    var persistentContainer: NSPersistentContainer {
        get { return underlyingPersistentContainer }
        set(value) { underlyingPersistentContainer = value }
    }
    var underlyingPersistentContainer: NSPersistentContainer!

    //MARK: - saveContext 

    var saveContextCallsCount = 0
    var saveContextCalled: Bool {
        return saveContextCallsCount > 0
    }
    var saveContextClosure: (() -> Void)?

    func saveContext () {
        saveContextCallsCount += 1
        saveContextClosure?()
    }

}
class DashboardCellRepresentableMock: DashboardCellRepresentable {

    //MARK: - display

    var displayCategoryDateAmountTypeCallsCount = 0
    var displayCategoryDateAmountTypeCalled: Bool {
        return displayCategoryDateAmountTypeCallsCount > 0
    }
    var displayCategoryDateAmountTypeReceivedArguments: (category: String, date: String, amount: String, type: CategoryType)?
    var displayCategoryDateAmountTypeReceivedInvocations: [(category: String, date: String, amount: String, type: CategoryType)] = []
    var displayCategoryDateAmountTypeClosure: ((String, String, String, CategoryType) -> Void)?

    func display(category: String, date: String, amount: String, type: CategoryType) {
        displayCategoryDateAmountTypeCallsCount += 1
        displayCategoryDateAmountTypeReceivedArguments = (category: category, date: date, amount: amount, type: type)
        displayCategoryDateAmountTypeReceivedInvocations.append((category: category, date: date, amount: amount, type: type))
        displayCategoryDateAmountTypeClosure?(category, date, amount, type)
    }

}
class DashboardDatamanagerProtocolMock: DashboardDatamanagerProtocol {

    //MARK: - fetchAccounts

    var fetchAccountsCompletionCallsCount = 0
    var fetchAccountsCompletionCalled: Bool {
        return fetchAccountsCompletionCallsCount > 0
    }
    var fetchAccountsCompletionReceivedCompletion: (([Account]) -> Void)?
    var fetchAccountsCompletionReceivedInvocations: [(([Account]) -> Void)] = []
    var fetchAccountsCompletionClosure: ((@escaping ([Account]) -> Void) -> Void)?

    func fetchAccounts(completion: @escaping ([Account]) -> Void) {
        fetchAccountsCompletionCallsCount += 1
        fetchAccountsCompletionReceivedCompletion = completion
        fetchAccountsCompletionReceivedInvocations.append(completion)
        fetchAccountsCompletionClosure?(completion)
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

    var loadedDashboardCallsCount = 0
    var loadedDashboardCalled: Bool {
        return loadedDashboardCallsCount > 0
    }
    var loadedDashboardReceivedDashboard: Dashboard?
    var loadedDashboardReceivedInvocations: [Dashboard] = []
    var loadedDashboardClosure: ((Dashboard) -> Void)?

    func loaded(dashboard: Dashboard) {
        loadedDashboardCallsCount += 1
        loadedDashboardReceivedDashboard = dashboard
        loadedDashboardReceivedInvocations.append(dashboard)
        loadedDashboardClosure?(dashboard)
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

    var numberOfTransactionsPerMoneyAccountSectionCallsCount = 0
    var numberOfTransactionsPerMoneyAccountSectionCalled: Bool {
        return numberOfTransactionsPerMoneyAccountSectionCallsCount > 0
    }
    var numberOfTransactionsPerMoneyAccountSectionReceivedSection: Int?
    var numberOfTransactionsPerMoneyAccountSectionReceivedInvocations: [Int] = []
    var numberOfTransactionsPerMoneyAccountSectionReturnValue: Int!
    var numberOfTransactionsPerMoneyAccountSectionClosure: ((Int) -> Int)?

    func numberOfTransactionsPerMoneyAccount(section: Int) -> Int {
        numberOfTransactionsPerMoneyAccountSectionCallsCount += 1
        numberOfTransactionsPerMoneyAccountSectionReceivedSection = section
        numberOfTransactionsPerMoneyAccountSectionReceivedInvocations.append(section)
        return numberOfTransactionsPerMoneyAccountSectionClosure.map({ $0(section) }) ?? numberOfTransactionsPerMoneyAccountSectionReturnValue
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
class UserDefaultsAccesableMock: UserDefaultsAccesable {

    //MARK: - isFirstAccess

    var isFirstAccessCallsCount = 0
    var isFirstAccessCalled: Bool {
        return isFirstAccessCallsCount > 0
    }
    var isFirstAccessReturnValue: Bool!
    var isFirstAccessClosure: (() -> Bool)?

    func isFirstAccess() -> Bool {
        isFirstAccessCallsCount += 1
        return isFirstAccessClosure.map({ $0() }) ?? isFirstAccessReturnValue
    }

    //MARK: - setFirstAccess

    var setFirstAccessCallsCount = 0
    var setFirstAccessCalled: Bool {
        return setFirstAccessCallsCount > 0
    }
    var setFirstAccessClosure: (() -> Void)?

    func setFirstAccess() {
        setFirstAccessCallsCount += 1
        setFirstAccessClosure?()
    }

}
