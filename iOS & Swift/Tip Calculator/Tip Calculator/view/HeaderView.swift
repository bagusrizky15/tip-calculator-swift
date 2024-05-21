//
//  HeaderView.swift
//  Tip Calculator
//
//  Created by BBPDEV on 20/11/23.
//

import UIKit

class HeaderView: UIView {
    
    private let topLabel: UILabel = {
        LabelFactory.build(
            text: nil,
            font: ThemeFont.bold(ofSize: 18))
    }()
    
    private let bottomLabel: UILabel = {
        LabelFactory.build(
            text: nil,
            font: ThemeFont.regular(ofSize: 16))
    }()
    
    private let topSpacer: UIView = UIView()
    private let bottomSpacer: UIView = UIView()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
        topSpacer,
        topLabel,
        bottomLabel,
        bottomSpacer
        ])
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topSpacer.snp.makeConstraints { make in
            make.height.equalTo(bottomSpacer)
        }
    }
    
    func configure(topLbl: String, bottomLbl: String){
        topLabel.text = topLbl
        bottomLabel.text = bottomLbl
    }
}

