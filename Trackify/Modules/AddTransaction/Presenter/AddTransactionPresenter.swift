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
    
    init(router: AddTransactionRouterProtocol) {
        self.router = router
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
    }
    
    func cancelAction() {
        router.cancelDismiss()
    }
    
    func doneAction() {
        router.doneDismiss()
    }
    
    func categoryTypeSelected(type: CategoryType) {
        
    }
    
    func selectAccountAction() {
        
    }
    
    func selectCategoryAction() {
        
    }
    
    func amountSelected(amount: String) {
        
    }
    
    func numberOfItemsToPick() -> Int {
        return 3
    }
    
    func pickerItem(row: Int) -> String {
        return "Hello"
    }
    
    func pickerItemSelected(row: Int) {
        
    }
}
