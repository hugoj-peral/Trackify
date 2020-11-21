//
//  AddTransactionInteractor.swift
//  Trackify
//
//  Created by Hugo Peral on 21/11/2020.
//

import Foundation

class AddTransactionInteractor {
    weak var presenter: AddTransactionInteractorOutputProtocol?
}

extension AddTransactionInteractor: AddTransactionInteractorInputProtocol {

    func loadSelectionData() {
        presenter?.selectionDataLoaded(data: (accounts: DashboardRandomGenerator().makeAllAccounts(transactionDistribution: [:]), categories: DashboardRandomGenerator().makeAllCategories()))
    }
    func saveTransaction(categoryType: CategoryType, account: Account, category: Category, amount: Double) {
        let transaction = Transaction(id: UUID(), category: category, date: Date(), amount: amount)
        print(transaction)
    }
}
