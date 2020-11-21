//
//  AddTransactionViewProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

protocol AddTransactionViewProtocol: AnyObject {
    func setViewTitle(_ title: String)
    func setTextContent(incomingCategory: (incoming: String, expense: String), account: String, category: String, amount: String)
    func setCategoryTransaction(category: CategoryType)
    func setSelectedAccount(_ account: String)
    func setSelectedCategory(_ category: String)
}
