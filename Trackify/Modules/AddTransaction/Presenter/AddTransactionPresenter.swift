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
    func cancelAction() {
        router.cancelDismiss()
    }
    
    func doneAction() {
        router.doneDismiss()
    }
}
