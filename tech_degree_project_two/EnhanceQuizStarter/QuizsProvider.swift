//
//  Quizs.swift
//  EnhanceQuizStarter
//
//  Created by Tong Wang on 2018-05-31.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import GameKit

//Question Type: with text options
let question_one = Question(question: "This was the only US President to serve more than two consecutive terms.", quesionType: .TextAnswer, options: ["George Washington","Franklin D. Roosevelt","Woodrow Wilson","Andrew Jackson"], correctAnswerIndex: 1)

let question_two = Question(question: "Which of the following countries has the most residents?", quesionType: .TextAnswer, options: ["Nigeria","Russia","Iran","Vietnam"], correctAnswerIndex: 0)

let question_three = Question(question: "In what year was the United Nations founded?", quesionType: .TextAnswer, options: ["1918","1919","1945","1954"], correctAnswerIndex: 2)

let question_four = Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", quesionType: .TextAnswer, options: ["Paris","Washington D.C.","New York City","Boston"], correctAnswerIndex: 2)

let question_five = Question(question: "Which nation produces the most oil?", quesionType: .TextAnswer, options: ["Iran","Iraq","Brazil","Canada"], correctAnswerIndex: 3)

let question_six = Question(question: "Which country has most recently won consecutive World Cups in Soccer?", quesionType: .TextAnswer, options: ["Italy","Brazil","Argetina","Spain"], correctAnswerIndex: 1)

let question_seven = Question(question:"Which of the following rivers is longest?" , quesionType: .TextAnswer, options: ["Yangtze","Mississippi","Congo","Mekong"], correctAnswerIndex: 1)
let question_eight = Question(question: "Which city is the oldest?", quesionType: .TextAnswer, options: ["Mexico City","Cape Town","San Juan","Sydney"], correctAnswerIndex: 0)

let question_nine = Question(question: "Which country was the first to allow women to vote in national elections?", quesionType: .TextAnswer, options: ["Poland","United States","Sweden","Senegal"], correctAnswerIndex: 0)

let question_ten = Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", quesionType: .TextAnswer, options: ["France","Germany","Japan","Great Britian"], correctAnswerIndex: 3)
//Question Type: True or False
let true_falseQeustion_one = Question(question: "Only female koalas can whistle", quesionType: .TrueFalse, options: ["True","False"], correctAnswerIndex: 1)
let true_falseQeustion_two = Question(question: "Blue whales are technically whales", quesionType: .TrueFalse, options: ["True","False"], correctAnswerIndex: 0)
let true_falseQeustion_three = Question(question: "Camels are cannibalistic", quesionType: .TrueFalse, options: ["True","False"], correctAnswerIndex: 1)
let true_falseQeustion_four = Question(question: "All ducks are birds", quesionType: .TrueFalse, options: ["True","False"], correctAnswerIndex: 0)

// Question data has been abstracted into Quiz object
class Quiz {
    var questions:[Question] = [question_one,question_two,question_three,question_four,question_five,
                                question_six,question_seven,question_eight,question_nine,question_ten,
                                true_falseQeustion_one,true_falseQeustion_two,true_falseQeustion_three,
                                true_falseQeustion_four]
    var question_order:[Int] = []
    func random_popQuestion() -> Question {
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count )
        if !(self.question_order.contains(randomNum)){
            self.question_order.append(randomNum)
            return questions[randomNum]
        }else {
            return self.random_popQuestion()
        }
    }
}















