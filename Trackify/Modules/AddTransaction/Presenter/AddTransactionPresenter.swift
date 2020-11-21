//
//  AddTransactionPresenter.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

final class AddTransactionPresenter {
    
    weak var view: AddTransactionViewProtocol?
    let router: AddTransactionRouterProtocol
    let interactor: AddTransactionInteractorInputProtocol
    
    var categoryTypeSelected: CategoryType = .income
    var accountSelected: Account?
    var categorySelected: Category?
    var amountSelected: Double?
    
    var listOfCategories: [Category]!
    var listOfAccounts: [Account]!
    
    // MARK : List variables
    enum ListOption {
        case account, category
    }
    var listSelected: ListOption!
    var listDataSource: [String]!
    
    init(router: AddTransactionRouterProtocol, interactor: AddTransactionInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func validateData() {
        guard let amount = amountSelected,
              let category = categorySelected,
              let account = accountSelected else { return }
        
        interactor.saveTransaction(categoryType: categoryTypeSelected, account: account, category: category, amount: amount)
    }
}

extension AddTransactionPresenter: AddTransactionPresenterProtocol {
    func viewDidLoad() {
        view?.setViewTitle("add_transaction_title".localized)
        view?.setTextContent(incomingCategory: (incoming: "incoming".localized, expense: "expense".localized),
                             account: "select_account".localized,
                             category: "select_category".localized,
                             amount: "enter_amount".localized)
        view?.setCategoryTransaction(category: .income)
        interactor.loadSelectionData()
    }
    
    func cancelAction() {
        router.cancelDismiss()
    }
    
    func doneAction() {
        validateData()
    }
    
    func categoryTypeSelected(type: CategoryType) {
        categoryTypeSelected = type
        view?.setSelectedCategory("")
        categorySelected = nil
    }
    
    func selectAccountAction() {
        listSelected = .account
        listDataSource = listOfAccounts.map { $0.name }
        if accountSelected == nil {
            accountSelected = listOfAccounts.first
            view?.setSelectedAccount(accountSelected!.name)
        }
    }
    
    func selectCategoryAction() {
        listSelected = .category
        listDataSource = listOfCategories.filter({$0.type == categoryTypeSelected}).map { $0.name }
        if categorySelected == nil {
            categorySelected = listOfCategories.filter({$0.type == categoryTypeSelected}).first
            view?.setSelectedCategory(categorySelected!.name)
        }
    }
    
    func amountSelected(amount: String) {
        amountSelected = Double(amount)
    }
    
    func numberOfItemsToPick() -> Int {
        return listDataSource.count
    }
    
    func pickerItem(row: Int) -> String {
        return listDataSource[row]
    }
    
    func pickerItemSelected(row: Int) {
        switch listSelected {
        case .account:
            accountSelected = listOfAccounts[row]
            view?.setSelectedAccount(accountSelected!.name)
        case .category:
            categorySelected = listOfCategories[row]
            view?.setSelectedCategory(categorySelected!.name)
        default:
            break
        }
    }
}

extension AddTransactionPresenter: AddTransactionInteractorOutputProtocol {
    func selectionDataLoaded(data: (accounts: [Account], categories: [Category])) {
        listOfAccounts = data.accounts
        listOfCategories = data.categories
    }
    
    func transactionSaved() {
        router.doneDismiss()
    }
}
