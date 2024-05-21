//
//  Tip.swift
//  Tip Calculator
//
//  Created by BBPDEV on 20/11/23.
//

import UIKit

enum Tip {
    case none
    case tipTenPercent
    case tipFifteenPercent
    case tipTwentyPercent
    case customTip(value: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            return ""
        case .tipTenPercent:
            return "10%"
        case .tipFifteenPercent:
            return "15%"
        case .tipTwentyPercent:
            return "20%"
        case .customTip(let value):
            return String(value)
            
        }
    }
}
