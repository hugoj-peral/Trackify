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
        tableView.register(DashboardCell.self, forCellReuseIdentifier: String(describing: DashboardCell.self))
    }
    
    // MARK: IBActions
    @IBAction func addTapped(_ sender: Any) {
        presenter.addTransactionAction()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfMoneyAccounts()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfTransactionsPerMoneyAccount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DashboardCell.self), for: indexPath) as! DashboardCell
        presenter.fill(cell: cell, section: indexPath.section, row: indexPath.row)
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:String(describing: DashboardHeader.self)) as! DashboardHeader
        presenter.fill(header: view, section: section)
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
