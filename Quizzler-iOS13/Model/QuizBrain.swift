//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Erika H on 9/5/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    // Questions
    let quiz = [
        Question(q: "Is Cocoa an application development environments for OS X?", a: "True"),
        Question(q: "Doe's Cocoa includes the Foundation and AppKit frameworks?", a: "True"),
        Question(q: "Is iOS android based?", a: "False")
    ]
    
    // Var that keeps track of current question
    var questionNumber = 0
    // Var keepint track of score
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            // User got it right
            score += 1
            return true
        } else {
            // User got it wrong
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        let progress =  Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        // Safety check next question
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            // Quiz restarts
            questionNumber = 0
            score = 0
        }
    }
    
    
}

