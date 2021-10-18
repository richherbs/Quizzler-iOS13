//
//  QuizBrain.swift
//  QuizBrain
//
//  Created by Richard Herbert on 18/10/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    var currentQuestion = 0
    var score = 0
    let quiz: [Question] = [
        Question(
            q: "Which is the largest organ in the human body?",
            a: ["Heart", "Skin", "Large Intestine"],
            correctAnswer: "Skin"
        ),
        Question(
            q: "Five dollars is worth how many nickels?",
            a: ["25", "50", "100"],
            correctAnswer: "100"),
        Question(
            q: "What do the letters in the GMT time zone stand for?",
            a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
            correctAnswer: "Greenwich Mean Time"
        ),
        Question(
            q: "What is the French word for 'hat'?",
            a: ["Chapeau", "Écharpe", "Bonnet"],
            correctAnswer: "Chapeau"
        ),
        Question(
            q: "In past times, what would a gentleman keep in his fob pocket?",
            a: ["Notebook", "Handkerchief", "Watch"],
            correctAnswer: "Watch"
        ),
        Question(
            q: "How would one say goodbye in Spanish?",
            a: ["Au Revoir", "Adiós", "Salir"],
            correctAnswer: "Adiós"
        ),
        Question(
            q: "Which of these colours is NOT featured in the logo for Google?",
            a: ["Green", "Orange", "Blue"],
            correctAnswer: "Orange"
        ),
        Question(
            q: "What alcoholic drink is made from molasses?",
            a: ["Rum", "Whisky", "Gin"],
            correctAnswer: "Rum"
        ),
        Question(
            q: "What type of animal was Harambe?",
            a: ["Panda", "Gorilla", "Crocodile"],
            correctAnswer: "Gorilla"
        ),
        Question(
            q: "Where is Tasmania located?",
            a: ["Indonesia", "Australia", "Scotland"],
            correctAnswer: "Australia"
        )
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        print(userAnswer)
        let result = quiz[currentQuestion].correctAnswer == userAnswer
        
        if result {
            self.incScore()
        }
        
        return result
    }
    
    func getQuestionText () -> String {
        return self.quiz[currentQuestion].text
    }
    
    func getProgress () -> Float {
        return Float(self.currentQuestion + 1) / Float(self.quiz.count)
    }
    
    mutating func nextQuestion() {
        if (self.currentQuestion < (self.quiz.count - 1)) {
            self.currentQuestion += 1
        } else {
            self.currentQuestion = 0
            self.resetScore()
        }
    }
    
    mutating func incScore() {
        self.score += 1
    }
    
    mutating func resetScore() {
        self.score = 0
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    func getAnswerText(_ buttonNumber: Int) -> String {
        return quiz[currentQuestion].answer[buttonNumber]
    }
}
