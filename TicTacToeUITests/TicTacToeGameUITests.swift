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
        
        app = XCUIApplication()
        app.launch()
    }
}
