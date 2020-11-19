//
//  DashboardViewController.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

final class DashboardViewController: UITableViewController {
    
    let presenter: DashboardPresenterProtocol
    
    init(presenter: DashboardPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerReusableViews()
        presenter.viewDidLoad()
    }
    
    // MARK: - View setup
    func setupView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    func registerReusableViews() {
        tableView.register(DashboardHeader.self, forHeaderFooterViewReuseIdentifier: String(describing: DashboardHeader.self))
    }
    
    // MARK: IBActions
    @IBAction func addTapped(_ sender: Any) {
        print("Add tapped")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfMoneyAccounts()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfTransactionsPerMoneyAccount()
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:String(describing: DashboardHeader.self)) as! DashboardHeader
        presenter.fill(header: view, moneyAccount: MoneyAccount.allCases[section])
        return view
    }
}

extension DashboardViewController: DashboardViewProtocol {
    func refresh() {
        tableView.reloadData()
    }
    
    func setViewTitle(_ title: String) {
        self.title = title
    }
}
