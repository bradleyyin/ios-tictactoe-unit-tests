//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Bradley Yin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe

class GameBoardTests:XCTestCase {
    
    //unit test always start with test
    func testGameBoard() {
        //XCTFail("Gameboard not function properly")
        
        let board = GameBoard()
    }
    
    func testNewBoardIsEmpty() {
        let board = GameBoard()
        
        //board[0,0] //top left corner
        //how do we know if it's empty
        
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    
}
