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
    
    let accountButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(selectAccountTapped), for: .touchUpInside)
        return button
    }()
    
    let categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(selectCategory), for: .touchUpInside)
        return button
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
        hideKeyboardWhenTappedAround()
    }
    
    func addNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    
    func addStackView() {
        let stackview = UIStackView(arrangedSubviews: [transactionType, accountButton, categoryButton, amountTextfield])
        stackview.axis = .vertical
        stackview.spacing = 16
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackview)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 32),
            stackview.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -32),
            stackview.topAnchor.constraint(equalTo: guide.topAnchor, constant: 32),
        ])
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
    
    @IBAction func selectAccountTapped(_ sender: Any) {
        presenter.selectAccountAction()
    }
    
    @IBAction func selectCategory(_ sender: Any) {
        presenter.selectCategoryAction()
    }
    
    @objc func dismissKeyboard() {
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
        accountButton.setTitle(account, for: .normal)
        categoryButton.setTitle(category, for: .normal)
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
        accountButton.setTitle(account, for: .normal)
    }
    
    func setSelectedCategory(_ category: String) {
        categoryButton.setTitle(category, for: .normal)
    }
}
