//
//  UIViewController+NavigableView.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

protocol NavigableView: AnyObject {
    func presentEmbebed(view: NavigableView)
    func dismiss(completion: (() -> Void)?)

}

extension UIViewController: NavigableView {
    func presentEmbebed(view: NavigableView) {
        present(UINavigationController(rootViewController: view as! UIViewController), animated: true, completion: nil)
    }
    
    func dismiss(completion: (() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
}
