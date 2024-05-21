//
//  UIView+Extension.swift
//  Tip Calculator
//
//  Created by BBPDEV on 18/11/23.
//

import UIKit

extension UIView{
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float){
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.cornerRadius = radius
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }
    
    func addCornerRadius (radius: CGFloat){
        layer.cornerRadius = radius
        layer.masksToBounds = false
    }
    
    func addRoundedCorners(corners: CACornerMask, radius: CGFloat){
        layer.cornerRadius = radius
        layer.maskedCorners = [corners]
    }
}
