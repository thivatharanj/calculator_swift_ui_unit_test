//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by User on 1/18/24.
//

import XCTest

final class CalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["5"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["="].tap()
        let sumText = app.staticTexts["11"]
        XCTAssertTrue(sumText.exists)

        app.buttons["AC"].tap()
        let acText = app.staticTexts["0"]
        XCTAssertTrue(acText.exists)
        
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
