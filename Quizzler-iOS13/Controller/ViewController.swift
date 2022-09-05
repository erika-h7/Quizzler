//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Erika H on 9/05/2022.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Score Label
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Label text
    @IBOutlet weak var questionLabel: UILabel!
    
    // Buttons
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // Progress Bar
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Question instance
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateUI()
    }
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // User answer
        let userAnswer = sender.currentTitle! // True or Flase
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // Answer checker
        if userGotItRight {
            print("Correct!")
            sender.backgroundColor = UIColor.green
        } else {
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        // Next question check
        quizBrain.nextQuestion()
        
        // Button color changer time delay
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func updateUI(){
        // Ui text(question)
        questionLabel.text = quizBrain.getQuestionText()
        
        // Progress Bar
        progressBar.progress = quizBrain.getProgress()
        
        // Score tracker
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // Buttons
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
}

