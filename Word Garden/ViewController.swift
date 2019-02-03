//
//  ViewController.swift
//  Word Garden
//
//  Created by Timothy Yang on 2/2/19.
//  Copyright © 2019 Timothy Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var guessedLetterField: UITextField!
    
    @IBOutlet weak var guessLetterButton: UIButton!
    
    @IBOutlet weak var guessCountLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var flowerImageView: UIImageView!
    
    var wordToGuess = "SWIFT"
    var letterGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        formatUserGuessLabel()
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        letterGuessed += guessedLetterField.text!
        for letter in wordToGuess {
            if letterGuessed.contains(letter) {
                revealedWord += " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        userGuessLabel.text = revealedWord
        guessCountLabel.text = "You've Made 0 Guesses"
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount += 1
        
        
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining -= 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
            
        }
        let revealedWord = userGuessLabel.text!
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You Lose"
        } else if !revealedWord.contains("_") {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You Win, it took \(guessCount) guesses"
        } else {
            let guess = ( guessCount == 1 ? "Guess" : "Guesses")
            
            guessCountLabel.text = "You've Made \(guessCount) \(guess)"
        }
    }
    
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
        
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
       // updateUIAfterGuess()
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        letterGuessed = ""
        flowerImageView.image = UIImage(named: "flower8")
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessCount = 0
        formatUserGuessLabel()
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
       //print("field changed")
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = String(letterGuessed)
            guessLetterButton.isEnabled = true
        } else {
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
        
    }
    
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
        //guessLetterButton.isEnabled = false
    }


}

