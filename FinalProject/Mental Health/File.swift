//
//  File.swift
//  FinalProject
//
//  Created by Umang Dhingra on 8/1/24.
//

import Foundation
struct Question {
    let text: String
    let answers: [String]
}

struct Quiz {
    var questions: [Question] = [
        Question(text: "What's your favorite color?", answers: ["Red", "Blue", "Green", "Yellow"]),
        Question(text: "What's your favorite animal?", answers: ["Dog", "Cat", "Rabbit", "Bird"]),
        Question(text: "What's your favorite food?", answers: ["Pizza", "Sushi", "Burger", "Salad"]),
        Question(text: "What's your favorite season?", answers: ["Spring", "Summer", "Fall", "Winter"])
    ]
}
