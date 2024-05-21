//
//  UIResponder+Extension.swift
//  Tip Calculator
//
//  Created by BBPDEV on 30/11/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
