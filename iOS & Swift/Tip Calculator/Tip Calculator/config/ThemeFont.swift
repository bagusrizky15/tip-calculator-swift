//
//  ThemeFont.swift
//  Tip Calculator
//
//  Created by BBPDEV on 12/11/23.
//

import UIKit

struct ThemeFont{
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func demiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Demi-Bold", size: size) ?? .systemFont(ofSize: size)
    }
}
