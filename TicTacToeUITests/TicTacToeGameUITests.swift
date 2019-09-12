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
    
       //AAA = Arrange, Act, Assert
    
    func testGameBoardResetClearBoard() {
        
        
        //Arrange
        for i in 0 ..< 9 {
            let button = buttonAt(i)
            button.tap()
        }
        
        //Act
        restartButton.tap()
        
        //Assert
        for i in 0 ..< 9 {
            XCTAssertEqual(" ", buttonAt(i).label)
        }
        
        XCTAssertEqual("Player X's turn", statusLabel.label)
    }
    
    func testPlayerXVerticalWin1() {
        buttonAt(0).tap()
        buttonAt(1).tap()
        buttonAt(3).tap()
        buttonAt(4).tap()
        buttonAt(6).tap()
        //player X has won
        XCTAssertEqual("Player X won!", statusLabel.label)
    }
}
