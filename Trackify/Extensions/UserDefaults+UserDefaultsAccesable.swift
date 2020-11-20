//
//  UserDefaults+UserDefaultsAccesable.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

fileprivate enum Constants {
    static let firstLaunchKey = "com.trackify.firstlaunch"
}

// sourcery: AutoMockable
protocol UserDefaultsAccesable {
    func isFirstAccess() -> Bool
    func setFirstAccess()
}

extension UserDefaults: UserDefaultsAccesable {
    func isFirstAccess() -> Bool {
        return !self.bool(forKey: Constants.firstLaunchKey)
    }
    
    func setFirstAccess() {
        self.setValue(true, forKey: Constants.firstLaunchKey)
    }
}
