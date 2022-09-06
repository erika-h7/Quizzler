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
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
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
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        // Score tracker
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // Progress Bar
        progressBar.progress = quizBrain.getProgress()
        
        // Buttons
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
    }
    
}

