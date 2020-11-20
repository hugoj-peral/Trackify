//
//  DashboardRandomGenerator.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

protocol DashboardRandomGenerable {
    func makeRandomDashboard() -> Dashboard
    func makeAllAccounts(transactionDistribution: [Int: [Transaction]]) -> [Account]
    func makeAllCategories() -> [Category]
    func makeRandomTransactions(categories: [Category]) -> [Transaction]
}

final class DashboardRandomGenerator: DashboardRandomGenerable {
    
    func makeRandomDashboard() -> Dashboard {
        var transactionDistribution: [Int: [Transaction]] = [:]
        transactionDistribution[1] = []
        transactionDistribution[2] = []
        transactionDistribution[3] = []
        makeRandomTransactions(categories: makeAllCategories()).forEach {
            let position = Int.random(in: 1...3)
            transactionDistribution[position]!.append($0)
        }
        
        return Dashboard(accounts: makeAllAccounts(transactionDistribution: transactionDistribution))
    }

    func makeAllAccounts(transactionDistribution: [Int: [Transaction]]) -> [Account] {
        var accounts: [Account] = []
        let transactionsAccount1 = transactionDistribution[1] != nil ? transactionDistribution[1]! : []
        accounts.append(Account(id: UUID(), name: "Cash", transactions: transactionsAccount1, balance: transactionsAccount1.map( {$0.amount}).reduce(0, +)))
        let transactionsAccount2 = transactionDistribution[2] != nil ? transactionDistribution[2]! : []
        accounts.append(Account(id: UUID(), name: "Credit Card", transactions: transactionsAccount2, balance: transactionsAccount2.map( {$0.amount}).reduce(0, +)))
        let transactionsAccount3 = transactionDistribution[3] != nil ? transactionDistribution[3]! : []
        accounts.append(Account(id: UUID(), name: "Bank Account", transactions: transactionsAccount3, balance: transactionsAccount3.map( {$0.amount}).reduce(0, +) ))
        
        return accounts
    }

    func makeAllCategories() -> [Category] {
        var categories: [Category] = []
        
        categories.append(Category(id: UUID(), name: "Tax", type: .expense))
        categories.append(Category(id: UUID(), name: "Grocery", type: .expense))
        categories.append(Category(id: UUID(), name: "Entretaiment", type: .expense))
        categories.append(Category(id: UUID(), name: "Gym", type: .expense))
        categories.append(Category(id: UUID(), name: "Health", type: .expense))
        categories.append(Category(id: UUID(), name: "Salary", type: .income))
        categories.append(Category(id: UUID(), name: "Dividends", type: .income))
        
        return categories
    }

    func makeRandomTransactions(categories: [Category]) -> [Transaction] {
        var transactions: [Transaction] = []
        
        let numberOfTransactions = Int.random(in: 1...1000)
        for _ in 1...numberOfTransactions {
            let category = categories.randomElement()!
            var multiplier: Double = 1
            var maxAmount: Double = 2000
            if case .expense = category.type {
                multiplier = -1
                maxAmount = 400
            }
            transactions.append(Transaction(id: UUID(), category: category, date: generateRandomDate(daysBack: 100), amount: multiplier * Double.random(in: 0.1...maxAmount)))
        }
        
        return transactions.sorted { $0.date > $1.date }
    }
    
    private func generateRandomDate(daysBack: Int)-> Date{
        let day = arc4random_uniform(UInt32(daysBack))+1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        
        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = -1 * Int(day - 1)
        offsetComponents.hour = -1 * Int(hour)
        offsetComponents.minute = -1 * Int(minute)
        
        guard let randomDate = gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0) ) else { return Date() }
        return randomDate
    }
}
