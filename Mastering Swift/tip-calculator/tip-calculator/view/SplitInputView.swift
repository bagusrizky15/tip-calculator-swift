//
//  SplitInputView.swift
//  tip-calculator
//
//  Created by BBPDEV on 05/02/24.
//

import UIKit

class SplitInputView: UIView{
    init(){
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        backgroundColor = .systemPink
    }
}
