//
//  DashboardViewProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import Foundation

// sourcery: AutoMockable
protocol DashboardViewProtocol: AnyObject {
    func refresh()
    func setViewTitle(_ title: String)
}
