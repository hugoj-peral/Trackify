//
//  AddTransactionRouterProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

// sourcery: AutoMockable
protocol AddTransactionRouterProtocol: AnyObject {
    func cancelDismiss()
    func doneDismiss()
}
