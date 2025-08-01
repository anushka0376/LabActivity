//
//  Question.swift
//  personalityQuiz
//
//  Created by Anushka Bhatnagar on 30/07/25.
//

import Foundation

struct Question{
    var text : String
    var type : ResponseType
    var answers : [Answer]
}

enum ResponseType : String {
    case single, multiple , ranged
}

struct Answer{
    var text : String
    var type : AnimalType
}

enum AnimalType : Character {
    case loin = "🦁", cat = "🐯", rabbit = "🐇" , turtle = "🐢"
    
    var definition : String {
        switch self {
        case .loin:
            return "You are incredibly outgoing.The Lion is a majestic and powerful animal"
        case .cat:
            return "Mischievous, yet mild-tempered.The Cat is a graceful and independent animal"
        case .rabbit:
            return "You love everything that's soft.The Rabbit is a fast and agile animal"
        case .turtle:
            return "You are wise beyond your years,The Turtle is a slow and steady animal"
        }
    }
}
