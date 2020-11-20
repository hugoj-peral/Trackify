//
//  UIWindow+Factory.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

extension UIWindow {
    class func makeWindow(frame: CGRect, rootViewController: UIViewController) -> UIWindow {
        let window = UIWindow(frame: frame)
        window.backgroundColor = .white
        window.rootViewController = rootViewController
        return window
    }
}
