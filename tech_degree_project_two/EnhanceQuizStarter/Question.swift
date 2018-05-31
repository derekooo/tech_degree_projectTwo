//
//  QuestionProvider.swift
//  EnhanceQuizStarter
//
//  Created by Tong Wang on 2018-05-30.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import GameKit
enum QuestionType {
    case TrueFalse
    case TextAnswer
}


struct Question {
    let question: String
    let quesionType:QuestionType
    let options:[String]
    let correctAnswerIndex:Int
    var correctAnswer:String {
        return options[correctAnswerIndex]
    }
}



