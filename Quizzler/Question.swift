//
//  Question.swift
//  Quizzler
//
//  Created by Giulia Boscaro on 28/11/18.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
