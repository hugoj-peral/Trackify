//
//  AddTransactionPresenterProtocol.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

protocol AddTransactionPresenterProtocol: AnyObject {
    func viewDidLoad()
    func cancelAction()
    func doneAction()
    func categoryTypeSelected(type: CategoryType)
    func selectAccountAction()
    func selectCategoryAction()
    func amountSelected(amount: String)
    func numberOfItemsToPick() -> Int
    func pickerItem(row: Int) -> String
    func pickerItemSelected(row: Int)
}
