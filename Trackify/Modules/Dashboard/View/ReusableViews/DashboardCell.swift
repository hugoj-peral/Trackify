//
//  DashboardCell.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

// sourcery: AutoMockable
protocol DashboardCellRepresentable {
    func display(category: String, date: String, amount: String, type: CategoryType)
}

final class DashboardCell: UITableViewCell {
    let category: UILabel = UILabel.makeTitle()
    let date: UILabel = UILabel.makeSubTitle()
    let amount: UILabel = UILabel.makeTitle(textAlignment: .right)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        let stackviewVertical = UIStackView(arrangedSubviews: [category, date])
        stackviewVertical.axis = .vertical
        let stackviewHorizontal = UIStackView(arrangedSubviews: [stackviewVertical, amount])
        stackviewHorizontal.axis = .horizontal
        amount.textAlignment = .right
        
        stackviewHorizontal.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackviewHorizontal)
        NSLayoutConstraint.activate([
            stackviewHorizontal.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stackviewHorizontal.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackviewHorizontal.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackviewHorizontal.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

extension DashboardCell: DashboardCellRepresentable {
    func display(category: String, date: String, amount: String, type: CategoryType) {
        self.category.text = category
        self.date.text = date
        self.amount.text = amount
        
        if case .expense = type {
            self.amount.textColor = .red
        } else {
            self.amount.textColor = .green
        }
    }
}
