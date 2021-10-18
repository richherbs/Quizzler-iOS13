//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        self.questionLabel.text = quizBrain.getQuestionText()
        self.aButton.setTitle(quizBrain.getAnswerText(0), for: .normal)
        self.bButton.setTitle(quizBrain.getAnswerText(1), for: .normal)
        self.cButton.setTitle(quizBrain.getAnswerText(2), for: .normal)
        self.progressBar.progress = quizBrain.getProgress()
        self.scoreLabel.text = "Score: \(quizBrain.getScore())"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            self.aButton.backgroundColor = UIColor.clear
            self.bButton.backgroundColor = UIColor.clear
            self.cButton.backgroundColor = UIColor.clear
        }
    }
}
