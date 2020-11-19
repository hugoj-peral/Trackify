//
//  TableViewMock.swift
//  TrackifyTests
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

class TableViewMock: UITableView {
    var reloadDataCalled = false
    override func reloadData() {
        reloadDataCalled = true
    }

}
