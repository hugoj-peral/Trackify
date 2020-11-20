//
//  DashboardRandomGenerator.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

final class DashboardRandomGenerator {
    
    func makeRandomDashboard() -> Dashboard {
        var transactionDistribution: [Int: [Transaction]] = [:]
        transactionDistribution[1] = []
        transactionDistribution[2] = []
        transactionDistribution[3] = []
        makeRandomTransactions().forEach {
            let position = Int.random(in: 1...3)
            transactionDistribution[position]!.append($0)
        }
        
        return Dashboard(accounts: makeAllAccounts(transactionDistribution: transactionDistribution))
    }

    func makeAllAccounts(transactionDistribution: [Int: [Transaction]]) -> [Account] {
        var accounts: [Account] = []
        accounts.append(Account(id: 1, name: "Cash", transactions: transactionDistribution[1]!, balance: transactionDistribution[1]!.map( {$0.amount}).reduce(0, +)))
        accounts.append(Account(id: 2, name: "Credit Card", transactions: transactionDistribution[2]!, balance: transactionDistribution[2]!.map( {$0.amount}).reduce(0, +)))
        accounts.append(Account(id: 3, name: "Bank Account", transactions: transactionDistribution[3]!, balance: transactionDistribution[3]!.map( {$0.amount}).reduce(0, +) ))
        
        return accounts
    }

    func makeAllCategories() -> [Category] {
        var categories: [Category] = []
        
        categories.append(Category(id: 1, name: "Tax", type: .expense))
        categories.append(Category(id: 2, name: "Grocery", type: .expense))
        categories.append(Category(id: 3, name: "Entretaiment", type: .expense))
        categories.append(Category(id: 4, name: "Gym", type: .expense))
        categories.append(Category(id: 5, name: "Health", type: .expense))
        categories.append(Category(id: 6, name: "Salary", type: .income))
        categories.append(Category(id: 7, name: "Dividends", type: .income))
        
        return categories
    }

    func makeRandomTransactions() -> [Transaction] {
        var transactions: [Transaction] = []
        let allCategories = makeAllCategories()
        
        let numberOfTransactions = Int.random(in: 1...1000)
        for value in 1...numberOfTransactions {
            let category = allCategories.randomElement()!
            var multiplier: Double = 1
            var maxAmount: Double = 2000
            if case .expense = category.type {
                multiplier = -1
                maxAmount = 400
            }
            transactions.append(Transaction(id: UInt(value), category: category, date: generateRandomDate(daysBack: 100), amount: multiplier * Double.random(in: 0.1...maxAmount)))
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
