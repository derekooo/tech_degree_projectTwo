//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    let quizManager = QuizManagers()    //Model of MVC
    var currentQuestion: Question? = nil //keep track current question, then modify the view
    var gameSound: SystemSoundID = 0
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var option_three: UIButton!
    @IBOutlet weak var option_four: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        playGameStartSound()
        newDisplayQuestion()
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func newDisplayQuestion(){
        let question = quizManager.quizs.random_popQuestion()
        currentQuestion = question
        questionField.text = question.question
        if question.quesionType == .TrueFalse{ // True or False Question only have two options
            option_three.isHidden = true
            option_four.isHidden = true
            trueButton.setTitle(question.options[0], for: .normal)
            falseButton.setTitle(question.options[1], for: .normal)
        }else{                                  // .textAnswer question have 4 options
            option_three.isHidden = false
            option_four.isHidden = false
            trueButton.setTitle(question.options[0], for: .normal)
            falseButton.setTitle(question.options[1], for: .normal)
            option_three.setTitle(question.options[2], for: .normal)
            option_four.setTitle(question.options[3], for: .normal)
        }
        playAgainButton.isHidden = true
    }
   
    func newDisplayScore(){
        trueButton.isHidden = true
        falseButton.isHidden = true
        option_three.isHidden = true
        option_four.isHidden = true
        
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(quizManager.quiz_score) out of \(quizManager.quizRound) correct!"
    }
    
    func newNextRound() {
        if quizManager.QuestionAnswered == quizManager.quizRound {
            newDisplayScore()
        }else{
            newDisplayQuestion()
        }
    }
    
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.newNextRound()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        
        quizManager.QuestionAnswered += 1
        let selectedQuestion = currentQuestion
        
        playGameStartSound()
        if (sender === trueButton && quizManager.check_Answer(answer: trueButton.title(for: .normal)!, qeustion: selectedQuestion!) ){
            questionField.text = "Correct!"
            
        }else if(sender === falseButton && quizManager.check_Answer(answer: falseButton.title(for: .normal)!, qeustion: selectedQuestion!) ){
            questionField.text = "Correct!"
        }else if(sender === option_three && quizManager.check_Answer(answer: option_three.title(for: .normal)!, qeustion: selectedQuestion!) ){
            questionField.text = "Correct!"
        }else if (sender === trueButton && quizManager.check_Answer(answer: option_four.title(for: .normal)!, qeustion: selectedQuestion!) ){
            questionField.text = "Correct!"
        }else {
            questionField.text = "Sorry, wrong answer"
        }
        

        loadNextRound(delay: 2)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        option_three.isHidden = false
        option_four.isHidden = false
        
        //nextRound()
        quizManager.QuestionAnswered = 0
        quizManager.quizs.question_order = [] //reset the order of questions 
        newNextRound()
    }
    

}

