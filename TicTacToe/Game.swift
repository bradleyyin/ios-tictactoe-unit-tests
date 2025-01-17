//
//  Game.swift
//  TicTacToe
//
//  Created by Bradley Yin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    var moves: [Coordinate] = []
    
    mutating func restart() {
        //Restarts the game to a fresh state with an empty board, and player X starting.
        board = GameBoard()
        activePlayer = .x
        moves = []
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating func makeMark(at coordinate: Coordinate) {
        guard let activePlayer = activePlayer else { return }
        do {
            try board.place(mark: activePlayer, on: coordinate)
            moves.append(coordinate)
            
            if gameWon(board: board, isWonBy: .x) {
                self.winningPlayer = .x
                gameIsOver = true
                self.activePlayer = nil
            } else if gameWon(board: board, isWonBy: .o) {
                self.winningPlayer = .o
                gameIsOver = true
                self.activePlayer = nil
            } else if board.isFull {
                gameIsOver = true
                winningPlayer = nil
                self.activePlayer = nil
            } else if activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        } catch {
            print("Error making \(activePlayer) mark at \(coordinate): \(error)")
        }
    }
    
    mutating func removeLastMark() {
        guard let activePlayer = activePlayer, let move = moves.last else { return }
        do {
            try board.remove(on: move)
            moves.removeLast()
            
            if activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        } catch {
            print("Error removing \(activePlayer): \(error)")
        }
    }
    
    init() {
        self.board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    private(set) var board: GameBoard
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
  
}
