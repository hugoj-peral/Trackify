//
//  AddTransactionRouter.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

final class AddTransactionRouter {
    weak var view: NavigableView?
    let dismissBlock: (() -> Void)?
    
    init(completion: (() -> Void)?) {
        dismissBlock = completion
    }
}

extension AddTransactionRouter: AddTransactionRouterProtocol {

    func cancelDismiss() {
        view?.dismiss(completion: nil)
    }
    
    func doneDismiss() {
        view?.dismiss(completion: dismissBlock)
    }
}
