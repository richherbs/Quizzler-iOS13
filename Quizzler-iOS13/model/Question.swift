//
//  Question.swift
//  Question
//
//  Created by Richard Herbert on 18/10/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init (q text: String, a answer: String){
        self.text = text
        self.answer = answer
    }
}
