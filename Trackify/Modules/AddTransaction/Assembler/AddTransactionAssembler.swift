//
//  AddTransactionAssembler.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

protocol AddTransactionAssembler {
    func resolve(completion: (() -> Void)?) -> AddTransactionViewController
    func resolve(completion: (() -> Void)?) -> AddTransactionRouter
    func resolve(router: AddTransactionRouter) -> AddTransactionPresenter
}

extension AddTransactionAssembler {
    func resolve(completion: (() -> Void)?) -> AddTransactionViewController {
        let router: AddTransactionRouter = resolve(completion: completion)
        let presenter: AddTransactionPresenter = resolve(router: router)
        let view = AddTransactionViewController(presenter: presenter)
        presenter.view = view
        router.view = view
        
        return view
    }
    
    func resolve(completion: (() -> Void)?) -> AddTransactionRouter {
        return AddTransactionRouter(completion: completion)
    }
    
    func resolve(router: AddTransactionRouter) -> AddTransactionPresenter {
        return AddTransactionPresenter(router: router)
    }
}
