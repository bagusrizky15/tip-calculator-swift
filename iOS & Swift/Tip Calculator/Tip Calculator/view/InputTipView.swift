//
//  InputTipView.swift
//  Tip Calculator
//
//  Created by BBPDEV on 12/11/23.
//

import UIKit
import CombineCocoa
import Combine

class InputTipView: UIView{
    
    private var headerView: HeaderView = {
        let view = HeaderView()
        view.configure(
            topLbl: "Choose",
            bottomLbl: "your tip"
        )
        return view
    }()
    
    private lazy var tenPercentButton: UIButton = {
        let button = buildTipButton(tip: .tipTenPercent)
        button.tapPublisher.flatMap{(
            Just(Tip.tipTenPercent)
        )}.assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var fifteenPercentButton: UIButton = {
        let button = buildTipButton(tip: .tipFifteenPercent)
        button.tapPublisher.flatMap{(
            Just(Tip.tipFifteenPercent)
        )}.assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var twentyPercentButton: UIButton = {
        let button = buildTipButton(tip: .tipTwentyPercent)
        button.tapPublisher.flatMap{(
            Just(Tip.tipTwentyPercent)
        )}.assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var customTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom tip", for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.backgroundColor = ThemeColor.primary
        button.titleLabel?.textColor = .white
        button.addCornerRadius(radius: 8.0)
        button.tapPublisher.sink { _ in
            self.handleCustomButton()
        }.store(in: &cancellables)
        
        return button
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            tenPercentButton,
            fifteenPercentButton,
            twentyPercentButton
        ])
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 5
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            hStackView,
            customTipButton
        ])
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 5
        return view
    }()
    
    private let tipSubject: CurrentValueSubject<Tip, Never> = .init(.none)
    var valuePublisher: AnyPublisher<Tip, Never>{
        return tipSubject.eraseToAnyPublisher()
    }
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        super.init(frame: .zero)
        layout()
        observe()
    }
    
    func resetTip(){
        tipSubject.send(.none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        [headerView, vStackView].forEach(addSubview(_:))
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalTo(68)
            make.centerY.equalTo(vStackView.snp.centerY)
            make.trailing.equalTo(vStackView.snp.leading).offset(-24)
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        
    }
    
    private func handleCustomButton(){
        let alertView: UIAlertController = {
            let controller = UIAlertController(
                title: "Enter your tip",
                message: nil,
                preferredStyle: .alert)
            controller.addTextField{
                texfield in
                texfield.placeholder = "Make it generous!"
                texfield.keyboardType = .numberPad
                texfield.autocorrectionType = .no
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            let ok = UIAlertAction(title: "OK", style: .default){
                [weak self] _ in
                guard let text = controller.textFields?.first?.text,
                      let value = Int(text) else {return}
                self?.tipSubject.send(.customTip(value: value))
            }
            [ok,cancel].forEach(controller.addAction(_:))
            return controller
        }()
        parentViewController?.present(alertView, animated: true)
    }
    
    private func observe(){
        tipSubject.sink {[unowned self] tip in
            reset()
            switch tip {
            case .none:
                break
            case .tipTenPercent:
                tenPercentButton.backgroundColor = ThemeColor.secondary
            case .tipFifteenPercent:
                fifteenPercentButton.backgroundColor = ThemeColor.secondary
            case .tipTwentyPercent:
                twentyPercentButton.backgroundColor = ThemeColor.secondary
            case .customTip(let value):
                customTipButton.backgroundColor = ThemeColor.secondary
                let text = NSMutableAttributedString(
                    string: "$\(value)",
                    attributes: [.font: ThemeFont.bold(ofSize: 20)]
                )
                text.addAttributes([
                    .font: ThemeFont.bold(ofSize: 14)
                ],range: NSMakeRange(0, 1))
                customTipButton.setAttributedTitle(text, for: .normal)
            }
        }.store(in: &cancellables)
    }
    
    private func reset(){
        [tenPercentButton,
         fifteenPercentButton,
         twentyPercentButton,
         customTipButton].forEach{
            $0.backgroundColor = ThemeColor.primary
        }
        
        let text = NSMutableAttributedString(
            string: "Custom Tip",
            attributes: [.font: ThemeFont.bold(ofSize: 20)]
        )
        customTipButton.setAttributedTitle(text, for: .normal)
    }
    
    private func buildTipButton(tip: Tip) -> UIButton{
        let button = UIButton(type: .custom)
        button.backgroundColor = ThemeColor.primary
        button.tintColor = .white
        button.titleLabel?.textColor = .white
        button.addCornerRadius(radius: 8.0)
        let text = NSMutableAttributedString(
            string: tip.stringValue,
            attributes: [.font: ThemeFont.bold(ofSize: 20)]
        )
        text.addAttributes([
            .font: ThemeFont.demiBold(ofSize: 20)
        ], range: NSMakeRange(2, 1))
        button.setAttributedTitle(text, for: .normal)
        return button
    }
}



