//
//  DashboardAssembler.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

protocol DashboardAssembler {
    func resolve() -> DashboardViewController
    func resolve(router: DashboardRouter) -> DashboardPresenter
    func resolve() -> DashboardRouter
}

extension DashboardAssembler {
    func resolve() -> DashboardViewController {
        let router: DashboardRouter = resolve()
        let presenter: DashboardPresenter = resolve(router: router)
        let view: DashboardViewController = DashboardViewController(presenter: presenter)
        presenter.view = view
        router.view = view
        return view
    }
    
    func resolve(router: DashboardRouter) -> DashboardPresenter {
        return DashboardPresenter(router: router)
    }
    
    func resolve() -> DashboardRouter {
        return DashboardRouter()
    }
}
