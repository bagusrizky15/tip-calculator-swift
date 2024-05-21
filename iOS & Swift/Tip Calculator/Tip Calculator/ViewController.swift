//
//  ViewController.swift
//  Tip Calculator
//
//  Created by BBPDEV on 09/11/23.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa

class ViewController: UIViewController {

    private let logoView = LogoView()
    private let resultView = ResultView()
    private let inputBillView = InputBillView()
    private let inputTipView = InputTipView()
    private let inputSplitView = InputSplitView()
    private let viewModel = CalculatorViewModel()
    private var cancelable = Set<AnyCancellable>()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        logoView,
        resultView,
        inputBillView,
        inputTipView,
        inputSplitView,
        UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 36
        return stackView
    }()
    
    private lazy var viewTapPublisher: AnyPublisher<Void, Never> = {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        view.addGestureRecognizer(tapGesture)
        return tapGesture.tapPublisher.flatMap { _ in
            Just(())
        }.eraseToAnyPublisher()
    }()
    
    private lazy var logoViewTapPublisher: AnyPublisher<Void, Never> = {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        tapGesture.numberOfTapsRequired = 2
        logoView.addGestureRecognizer(tapGesture)
        return tapGesture.tapPublisher.flatMap { _ in
            Just(())
        }.eraseToAnyPublisher()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeColor.bg
        layout()
        bind()
        observe()
    }
    
    func observe(){
        viewTapPublisher.sink { [unowned self] _ in
            view.endEditing(true)
        }.store(in: &cancelable)
    }
    
    private func bind(){
        
        let input = CalculatorViewModel.Input(
            billPublisher: inputBillView.valuePublisher,
            tipPublisher: inputTipView.valuePublisher,
            splitPublisher: inputSplitView.valuePublisher,
            logoViewTapPublisher: logoViewTapPublisher
        )
        
        let output = viewModel.transform(input: input)
        
        output.updateViewPublisher.sink {[unowned self] result in
            resultView.configure(result: result)
        }.store(in: &cancelable)
        
        output.resetViewTapPublisher.sink { [unowned self] _ in
            inputBillView.reset()
            inputTipView.resetTip()
            inputSplitView.reset()
            
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 5.0, initialSpringVelocity: 0.5) {
                self.logoView.transform = .init(scaleX: 1.5, y: 1.5)
            } completion: { _ in
                UIView.animate(withDuration: 0.1){
                    self.logoView.transform = .identity
                }
            }
        }.store(in: &cancelable)
    }

    private func layout(){
        view.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-16)
        }
        
        logoView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        resultView.snp.makeConstraints { make in
            make.height.equalTo(224)
        }
        
        inputBillView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        inputTipView.snp.makeConstraints { make in
            make.height.equalTo(56+16+56)
        }
        
        inputSplitView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
}

