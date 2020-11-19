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
