//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by User on 1/18/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    func testAdd(){
        let math = calMaths()
        let res = math.addNumbers(x: 1, y: 2)
        XCTAssertEqual(res, 3)
    }
    
    func testSub(){
        let math = calMaths()
        let res = math.subNumbers(x: 8, y: 2)
        XCTAssertEqual(res, 6)
    }
    
    func testMulti(){
        let math = calMaths()
        let res = math.multiplyNumbers(x: 3, y: 2)
        XCTAssertEqual(res, 6)
    }
    func testDiv(){
        let math = calMaths()
        let res = math.divNumbers(x: 20, y: 5)
        XCTAssertEqual(res, 4)
    }

}
