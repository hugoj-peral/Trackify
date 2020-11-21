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
    func resolve(datamanager: AddTransactionDatamanager) -> AddTransactionInteractor
    func resolve(coreDataStack: CoreDataProvider) -> AddTransactionDatamanager
}

extension AddTransactionAssembler {
    func resolve(completion: (() -> Void)?) -> AddTransactionViewController {
        let router: AddTransactionRouter = resolve(completion: completion)
        let datamanager: AddTransactionDatamanager = resolve()
        let interactor: AddTransactionInteractor = resolve(datamanager: datamanager)
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
    
    func resolve(datamanager: AddTransactionDatamanager) -> AddTransactionInteractor {
        return AddTransactionInteractor(datamanager: datamanager)
    }
    
    func resolve(coreDataStack: CoreDataProvider = CoreDataStack.shared) -> AddTransactionDatamanager {
        return AddTransactionDatamanager(coreDataStack: coreDataStack)
    }
}
