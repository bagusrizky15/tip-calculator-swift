//
//  Tip_CalculatorTests.swift
//  Tip CalculatorTests
//
//  Created by BBPDEV on 09/11/23.
//

import XCTest
import Combine
@testable import Tip_Calculator

final class Tip_CalculatorTests: XCTestCase {
    
    ///sut -> system under test
    private var sut: CalculatorViewModel
    private var cancelables: Set<AnyCancellable>

    override func setUp() {
        sut = .init()
        cancelables = .init()
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
        sut = nil
        cancelables = nil
    }

}
