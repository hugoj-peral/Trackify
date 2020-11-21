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
    func resolve(router: AddTransactionRouter, interactor: AddTransactionInteractor) -> AddTransactionPresenter
    func resolve() -> AddTransactionInteractor
}

extension AddTransactionAssembler {
    func resolve(completion: (() -> Void)?) -> AddTransactionViewController {
        let router: AddTransactionRouter = resolve(completion: completion)
        let interactor: AddTransactionInteractor = resolve()
        let presenter: AddTransactionPresenter = resolve(router: router, interactor: interactor)
        let view = AddTransactionViewController(presenter: presenter)
        presenter.view = view
        router.view = view
        interactor.presenter = presenter
        
        return view
    }
    
    func resolve(completion: (() -> Void)?) -> AddTransactionRouter {
        return AddTransactionRouter(completion: completion)
    }
    
    func resolve(router: AddTransactionRouter, interactor: AddTransactionInteractor) -> AddTransactionPresenter {
        return AddTransactionPresenter(router: router, interactor: interactor)
    }
    
    func resolve() -> AddTransactionInteractor {
        return AddTransactionInteractor()
    }
}
