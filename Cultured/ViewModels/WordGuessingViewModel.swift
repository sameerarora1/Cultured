//
//  WordGuessingViewModel.swift
//  Cultured
//
//  Created by Austin Huguenard on 2/13/24.
//

import Foundation

class WordGuessingViewModel: ObservableObject {
    @Published var current_user: User? = nil
    @Published var current_word_guessing_game: WordGuessing? = nil
    
    func create_mock_wg_game() {
        print("creating a new game...")
        let options = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
        let answer = "j"
        startNewGame(options: options, answer: answer)
        print("new game created successfully!")
    }
    
    func startNewGame(options: [String], answer: String, title: String = "New Game") {
        current_word_guessing_game = WordGuessing(
            title: title,
            options: options,
            answer: answer
        )
    }
    
    func flipTile() {
        guard var game = current_word_guessing_game else { return }
        game.totalPoints -= game.flipPoints
        game.flipsDone += 1
        if (game.totalPoints == 0) {
            loseGame()
        }
        game.numberOfGuesses = 2
        current_word_guessing_game = game
    }
    
    func submitGuess(_ currentGuess: String) {
        guard var game = current_word_guessing_game else { return }
        game.numberOfGuesses -= 1
        
        if currentGuess.lowercased() == game.answer.lowercased() {
            winGame()
        } else {
            game.totalPoints -= game.flipPoints
            if game.numberOfGuesses == 0 {
                if (game.flipsDone == 0) {
                    loseGame()
                } else {
                    promptUser()
                }
            }
        }
        current_word_guessing_game = game
    }
    
    func winGame() {
        guard var game = current_word_guessing_game else { return }
        print(game.answer + " was the correct word. You Win!!")
    }
        
    func loseGame() {
        guard var game = current_word_guessing_game else { return }
        print("Game Over. The word was " + game.answer)
    }
    
    func promptUser() {
        print("Flip a tile!")
    }
    
}

/*
 game - word guessing game, card flipping style
 number of tiles (not decided yet, list of strings)
 currPoints = totalPoints - flipPoints
 9 tiles, 18 guesses (2 per flip)
 subtract 10 points for each flip
 ordered hints
 win criteria - guessing the right word (lowercase for everything)
 */
