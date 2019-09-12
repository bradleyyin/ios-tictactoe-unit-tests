//
//  TicTacToeGameUITests.swift
//  TicTacToeUITests
//
//  Created by Bradley Yin on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

class TicTacToeGameUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    func testRecording() {
        //place cursor here
        
        let app = XCUIApplication()
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let element = element2.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
        let element3 = element.children(matching: .other).element(boundBy: 0)
        let button = element3.children(matching: .button).matching(identifier: " ").element(boundBy: 0)
        button.tap()
        button.tap()
        element3.buttons[" "].tap()
        element.children(matching: .other).element(boundBy: 1).children(matching: .button).matching(identifier: " ").element(boundBy: 0).tap()
        element2.children(matching: .other).element(boundBy: 0).tap()
        app.buttons["Restart"].tap()
        
        
    }
    
    var statusLabel: XCUIElement {
        let label = app.staticTexts["GameViewController.statusLabel"]
        XCTAssertTrue(label.exists)
        return label
    }
    
    var restartButton: XCUIElement {
        let button = app.buttons["Restart"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    func buttonAt(_ index: Int) -> XCUIElement {
        let button = app.buttons["BoardViewController.button\(index)"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    func testGameBoardIsClearOnStart() {
        // TEST: status label
        // TEST: restart button
        // TEST: All buttons are blank
        
        XCTAssertEqual("Place your mark", statusLabel.label)
        
        XCTAssertEqual("Restart", restartButton.label)
        
        for i in 0 ..< 9 {
            XCTAssertEqual(" ", buttonAt(i).label)
        }
    }
    
    func testGameBoardResetClearBoard() {
        
        
        
        for i in 0 ..< 9 {
            let button = buttonAt(i)
            button.tap()
        }
        
        restartButton.tap()
        
        for i in 0 ..< 9 {
            XCTAssertEqual(" ", buttonAt(i).label)
        }
        
        XCTAssertEqual("Player X's turn", statusLabel.label)
    }
    

    
    
}
