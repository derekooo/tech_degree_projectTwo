//
//  QuizManager.swift
//  EnhanceQuizStarter
//
//  Created by Tong Wang on 2018-05-30.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import GameKit
let quiz = Quiz()
class QuizManagers {
    var quizs: Quiz = quiz
    var quiz_score = 0
    var QuestionAnswered:Int = 0
    
    var quizRound: Int {
        return quiz.questions.count
    }
    
    func check_Answer(answer:String,qeustion:Question) -> Bool{
        if answer == qeustion.correctAnswer {
            self.quiz_score += 1
            return true
        }else{
            return false
        }
    }
    
    
}
