//
//  CalculatorViewModel.swift
//  Tip Calculator
//
//  Created by BBPDEV on 21/11/23.
//

import Foundation
import Combine

class CalculatorViewModel {
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
        let logoViewTapPublisher: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
        let resetViewTapPublisher: AnyPublisher<Void, Never>
    }
    
    private var cancelables = Set<AnyCancellable>()
    private let audioPlayerService: AudioPlayerService
    
    init(audioPlayerService: AudioPlayerService = DefaultAudioPlayer()){
        self.audioPlayerService = audioPlayerService
    }
    
    func transform(input: Input) -> Output {
        
        let updateViewPublisher = Publishers.CombineLatest3(
            input.billPublisher,
            input.tipPublisher,
            input.splitPublisher
        ).flatMap { [unowned self] (bill, tip, split) in
            let totalTip = getTipAmount(bill: bill, tip: tip)
            let totalBill = bill + totalTip
            let pricePerPerson = totalBill / Double(split)
            
            let result = Result(
                amountPerson: pricePerPerson,
                totalBill: totalBill,
                totalTip: totalTip)
            
            return Just(result)
        }.eraseToAnyPublisher()
        
        let logoViewTapPublisher = input.logoViewTapPublisher.handleEvents( receiveOutput: { [unowned self] in
            audioPlayerService.playSound()
        }).flatMap {
            return Just($0)
        }.eraseToAnyPublisher()
        
        return Output(
            updateViewPublisher: updateViewPublisher,
            resetViewTapPublisher: logoViewTapPublisher
        )
        
    }
    
    private func getTipAmount(bill: Double, tip: Tip) -> Double {
        switch tip {
        case .none:
            return 0
        case .tipTenPercent:
            return bill * 0.1
        case .tipFifteenPercent:
            return bill * 0.15
        case .tipTwentyPercent:
            return bill * 0.2
        case .customTip(let value):
            return Double(value)
        }
    }
}
