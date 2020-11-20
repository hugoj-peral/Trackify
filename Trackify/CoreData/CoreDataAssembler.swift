//
//  CoreDataAssembler.swift
//  Trackify
//
//  Created by Hugo Peral on 20/11/2020.
//

import Foundation

protocol CoreDataAssembler {
    func resolve() -> CoreDataStack
}

extension CoreDataAssembler {
    func resolve() -> CoreDataStack {
        return CoreDataStack.shared
    }
}
