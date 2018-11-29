//
//  ViewController.swift
//  Quizzler
//
//  Created by Giulia Boscaro on 28/11/2018.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.questionList[0]
        questionLabel.text = firstQuestion.questionText
        
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.questionList[questionNumber].questionText
            updateUI()
        }
        else {
            
            let alert = UIAlertController(title: "End of the quiz", message: "You've finished all the questions, want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
                { (UIAlertAction) in
                  self.startOver()
                }
            )
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
            
        }
        

    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.questionList[questionNumber].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("That's correct! :)")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong answer :(")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
