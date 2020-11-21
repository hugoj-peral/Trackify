//
//  AddTransactionInteractorProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 21/11/2020.
//

import Foundation

protocol AddTransactionInteractorInputProtocol: AnyObject {
    func loadSelectionData()
    func saveTransaction(categoryType: CategoryType, account: Account, category: Category, amount: Double)
}

protocol AddTransactionInteractorOutputProtocol: AnyObject {
    func selectionDataLoaded(data: (accounts: [Account], categories: [Category]))
    func transactionSaved()
}
