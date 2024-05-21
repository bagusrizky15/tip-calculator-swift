//
//  ResultView.swift
//  Tip Calculator
//
//  Created by BBPDEV on 12/11/23.
//

import UIKit

class ResultView: UIView{
    
    private let headerLabel: UILabel = {
        LabelFactory.build(
            text: "Total p/person",
            font: ThemeFont.demiBold(ofSize: 18)
        )
    }()
    
    private let amountPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [.font: ThemeFont.bold(ofSize: 48)]
        )
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    
    private let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
        headerLabel,
        amountPriceLabel,
        horizontalLine,
        heightSpacerView(height: 0),
        hStackView
        ])
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private let totalBillView: AmountView = {
        let view = AmountView(title: "Total Bill", textAlignment: .left)
        return view
    }()
    
    private let totalTipView: AmountView = {
        let view = AmountView(title: "Total Tip", textAlignment: .right)
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            totalBillView,
        UIView(),
            totalTipView
        ])
        view.axis = .horizontal
        view.distribution = .fillEqually
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
        backgroundColor = .white
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.leading.equalTo(snp.leading).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.bottom.equalTo(snp.bottom).offset(-24)
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
        addShadow(
            offset: CGSize(width: 0, height: 2),
            color: .black,
            radius: 12.0,
            opacity: 0.1)
    }
    
    func configure(result: Result) {
        let text = NSMutableAttributedString(
            string: result.amountPerson.currencyFormatted,
            attributes: [.font: ThemeFont.bold(ofSize: 48)]
        )
        text.addAttributes([
            .font: ThemeFont.bold(ofSize: 24)
        ], range: NSMakeRange(0, 1))
        amountPriceLabel.attributedText = text
        totalBillView.configure(amount: result.totalBill)
        totalTipView.configure(amount: result.totalTip)
        
    }
    
    private func heightSpacerView(height: CGFloat) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
}

