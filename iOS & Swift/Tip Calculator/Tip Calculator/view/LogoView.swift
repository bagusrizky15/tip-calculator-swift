//
//  LogoView.swift
//  Tip Calculator
//
//  Created by BBPDEV on 12/11/23.
//

import UIKit

class LogoView: UIView{
    
    private let logoImage: UIImageView = {
        let image = UIImageView(image: .init(named: "icCalculatorBW"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Mr TIP",
            attributes: [.font: ThemeFont.demiBold(ofSize: 16)]
        )
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3) )
        label.attributedText = text
        return label
    }()
    
    private let bottomLabel: UILabel = {
        LabelFactory.build(
            text: "Calculator",
            font: ThemeFont.demiBold(ofSize: 20),
            textAlignment: .left
        )
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
        topLabel,
        bottomLabel
        ])
        view.axis = .vertical
        view.spacing = -4
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
        logoImage,
        vStackView
        ])
        view.axis = .horizontal
        view.spacing = 1
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
        addSubview(hStackView)
        hStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints { make in
            make.height.equalTo(logoImage.snp.width)
        }
    }
}


