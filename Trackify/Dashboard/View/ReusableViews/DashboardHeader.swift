//
//  DashboardHeader.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

// sourcery: AutoMockable
protocol DashboardHeaderRepresentable {
    func display(account: String, balance: String)
}

class DashboardHeader: UITableViewHeaderFooterView {
    let account = UILabel()
    let balance = UILabel()

    override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            configureContents()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        let stackview = UIStackView(arrangedSubviews: [account, balance])
        stackview.axis = .horizontal
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackview.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackview.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

extension DashboardHeader: DashboardHeaderRepresentable {
    func display(account: String, balance: String) {
        self.account.text = account
        self.balance.text = balance
    }
}
