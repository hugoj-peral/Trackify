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
        let segmentedControl = UISegmentedControl(items: ["Income", "Expense"])
        return segmentedControl
    }()
    
    let accountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select account", for: .normal)
        return button
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
    }
    
    // MARK - Setup View
    
    func setupView() {
        view.backgroundColor = .white
        addNavigationItems()
        addStackView()
    }
    
    func addNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    
    func addStackView() {
        let stackview = UIStackView(arrangedSubviews: [transactionType, accountButton])
        stackview.axis = .vertical
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackview)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 32),
            stackview.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 32),
            stackview.topAnchor.constraint(equalTo: guide.topAnchor, constant: 32),
        ])
    }
    
    // MARK: IBActions
    
    @IBAction func doneTapped(_ sender: Any) {
        presenter.doneAction()
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        presenter.cancelAction()
    }
}

extension AddTransactionViewController: AddTransactionViewProtocol {
    
}
