//
//  AddTransactionViewController.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import UIKit

final class AddTransactionViewController: UIViewController {
    
    let presenter: AddTransactionPresenterProtocol
    
    let transactionType: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["A", "B"])
        segmentedControl.addTarget(self, action: #selector(transactionTypeValueChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    let accountTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let categoryTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let amountTextfield: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    init(presenter: AddTransactionPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    // MARK - Setup View
    
    func setupView() {
        view.backgroundColor = .white
        addNavigationItems()
        addStackView()
        setupTextFields()
        hideKeyboardWhenTappedAround()
    }
    
    func addNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    
    func addStackView() {
        let stackview = UIStackView(arrangedSubviews: [transactionType, accountTextField, categoryTextField, amountTextfield])
        stackview.axis = .vertical
        stackview.spacing = 16
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackview)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 32),
            stackview.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -32),
            stackview.topAnchor.constraint(equalTo: guide.topAnchor, constant: 32)
        ])
    }
    
    func setupTextFields() {
        amountTextfield.inputAccessoryView = makeToolBar()
        categoryTextField.inputView = makePickerView()
        categoryTextField.inputAccessoryView = makeToolBar()
        categoryTextField.delegate = self
        accountTextField.inputView = makePickerView()
        accountTextField.inputAccessoryView = makeToolBar()
        accountTextField.delegate = self
    }
    
    func makePickerView() -> UIPickerView {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }
    
    func makeToolBar() -> UIToolbar {
        let toolBar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:100))
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        return toolBar
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
     }
    
    // MARK: IBActions
    
    @IBAction func doneTapped(_ sender: Any) {
        if let amount = amountTextfield.text {
            presenter.amountSelected(amount: amount)
        }
        presenter.doneAction()
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        presenter.cancelAction()
    }
    
    @IBAction func transactionTypeValueChanged(_ sender: Any) {
        presenter.categoryTypeSelected(type: transactionType.selectedSegmentIndex == 0 ? .income : .expense)
    }
    
    @objc func dismissKeyboard(_ sender: Any) {
           view.endEditing(true)
     }
}

extension AddTransactionViewController: AddTransactionViewProtocol {
    func setViewTitle(_ title: String) {
        self.title = title
    }
    
    func setTextContent(incomingCategory: (incoming: String, expense: String),
                        account: String,
                        category: String,
                        amount: String) {
        transactionType.setTitle(incomingCategory.incoming, forSegmentAt: 0)
        transactionType.setTitle(incomingCategory.expense, forSegmentAt: 1)
        accountTextField.placeholder = account
        categoryTextField.placeholder = category
        amountTextfield.placeholder = amount
    }
    
    func setCategoryTransaction(category: CategoryType) {
        switch category {
        case .income:
            transactionType.selectedSegmentIndex = 0
        default:
            transactionType.selectedSegmentIndex = 1
        }
    }
    
    func setSelectedAccount(_ account: String) {
        accountTextField.text = account
    }
    
    func setSelectedCategory(_ category: String) {
        categoryTextField.text = category
    }
}

extension AddTransactionViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.numberOfItemsToPick()
    }
}

extension AddTransactionViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.pickerItem(row: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        presenter.pickerItemSelected(row: row)
    }
}

extension AddTransactionViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == accountTextField {
            presenter.selectAccountAction()
        } else if textField == categoryTextField {
            presenter.selectCategoryAction()
        }
        return true
    }
}
