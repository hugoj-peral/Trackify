//
//  AddTransactionInteractor.swift
//  Trackify
//
//  Created by Hugo Peral on 21/11/2020.
//

import Foundation

class AddTransactionInteractor {
    weak var presenter: AddTransactionInteractorOutputProtocol?
    let datamanager: AddTransactionDatamanagerProtocol
    
    init(datamanager: AddTransactionDatamanagerProtocol) {
        self.datamanager = datamanager
    }
}

extension AddTransactionInteractor: AddTransactionInteractorInputProtocol {

    func loadSelectionData() {
        datamanager.fetchAccountsAndCategories { [weak self](data) in
            self?.presenter?.selectionDataLoaded(data: data)
        }
    }
    
    func saveTransaction(categoryType: CategoryType, account: Account, category: Category, amount: Double) {
        let transaction = Transaction(id: UUID(), category: category, date: Date(), amount: amount)
        datamanager.store(transaction: transaction, in: account) { [weak self] in
            self?.presenter?.transactionSaved()
        }
    }
}
