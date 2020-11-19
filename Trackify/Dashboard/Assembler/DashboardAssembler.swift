//
//  DashboardAssembler.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

protocol DashboardAssembler {
    func resolve() -> DashboardViewController
    func resolve() -> DashboardPresenter
}

extension DashboardAssembler {
    func resolve() -> DashboardViewController {
        let presenter: DashboardPresenter = resolve()
        let view: DashboardViewController = DashboardViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
    func resolve() -> DashboardPresenter {
        return DashboardPresenter()
    }
}
