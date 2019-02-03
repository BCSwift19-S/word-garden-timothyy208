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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
       // updateUIAfterGuess()
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
       //print("field changed")
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
    }
    
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }


}

