//
//  DashboardAssembler.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

protocol DashboardAssembler {
    func resolve() -> DashboardViewController
    func resolve(router: DashboardRouter, interactor: DashboardInteractor) -> DashboardPresenter
    func resolve() -> DashboardRouter
    func resolve() -> DashboardInteractor
    func resolve() -> DashboardDatamanager
}

extension DashboardAssembler {
    func resolve() -> DashboardViewController {
        let router: DashboardRouter = resolve()
        let interactor: DashboardInteractor = resolve()
        let presenter: DashboardPresenter = resolve(router: router, interactor: interactor)
        let view: DashboardViewController = DashboardViewController(presenter: presenter)
        presenter.view = view
        router.view = view
        interactor.presenter = presenter
        return view
    }
    
    func resolve(router: DashboardRouter, interactor: DashboardInteractor) -> DashboardPresenter {
        return DashboardPresenter(router: router, interactor: interactor)
    }
    
    func resolve() -> DashboardRouter {
        return DashboardRouter()
    }
    
    func resolve() -> DashboardInteractor {
        return DashboardInteractor(datamanager: resolve())
    }
    
    func resolve() -> DashboardDatamanager{
        return DashboardDatamanager()
    }
}
