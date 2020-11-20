//
//  UIViewController+NavigableView.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

protocol NavigableView: AnyObject {
    func present(view: NavigableView)
}

extension UIViewController: NavigableView {
    func present(view: NavigableView) {
        present(view as! UIViewController, animated: true, completion: nil)
    }
}
