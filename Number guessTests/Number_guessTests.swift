//
//  Number_guessTests.swift
//  Number guessTests
//
//  Created by Svetlana Yurkevich on 11/04/2023.
//

import XCTest
@testable import Number_guess

final class Number_guessTests: XCTestCase {

    func testExample() throws {
        
        let viewModel = ViewModel(min: 1, max: 20, secret: 5)
        
        viewModel.tryNumber(input: "4")
        XCTAssertEqual(viewModel.state, .smaller)
        
        viewModel.tryNumber(input: "5")
        XCTAssertEqual(viewModel.state, .winning)
        
        viewModel.tryNumber(input: "10")
        XCTAssertEqual(viewModel.state, .greater)
        
        viewModel.tryNumber(input: "")
        XCTAssertEqual(viewModel.state, .inputError)
    }
}
