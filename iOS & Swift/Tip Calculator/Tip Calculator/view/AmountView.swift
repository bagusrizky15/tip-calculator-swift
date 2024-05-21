//
//  AmountView.swift
//  Tip Calculator
//
//  Created by BBPDEV on 19/11/23.
//

import UIKit

class AmountView: UIView {
    
    var title: String
    var textAlignment: NSTextAlignment
    
    private lazy var titleLabel: UILabel = {
        LabelFactory.build(text: title, font: ThemeFont.regular(ofSize: 16))
    }()
    
    private let amountPrice: UILabel = {
        let label = UILabel()
        label.textColor = ThemeColor.primary
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [.font: ThemeFont.bold(ofSize: 24)]
        )
        text.addAttributes([.font: ThemeFont.bold(ofSize: 16)],
                           range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
        titleLabel,
        amountPrice
        ])
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    init(title: String, textAlignment: NSTextAlignment){
        self.title = title
        self.textAlignment = textAlignment
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(amount: Double) {
        let text = NSMutableAttributedString(
            string: amount.currencyFormatted,
            attributes: [.font: ThemeFont.bold(ofSize: 24)]
        )
        text.addAttributes([.font: ThemeFont.bold(ofSize: 16)], range: NSMakeRange(0, 1))
        amountPrice.attributedText = text
    }
    
    private func layout(){
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


