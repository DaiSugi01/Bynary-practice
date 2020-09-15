//
//  QuizBrain.swift
//  ConvertNumbers
//
//  Created by 杉原大貴 on 2020/09/14.
//  Copyright © 2020 杉原大貴. All rights reserved.
//

import Foundation

struct QuizBrain {
 
    var byteArr = ["0", "0", "0", "0", "0", "0", "0", "0"]
    var quizDecNumber = "256"
    var ansDecNumber = "0"
    var currentTime = Float(3)
    let time = Float(3)

    mutating func resetQuiz() {
        byteArr = ["0", "0", "0", "0", "0", "0", "0", "0"]
        ansDecNumber = "0"
    }
    
    mutating func getProgress() -> Float {
        currentTime -= Float(1)
        return currentTime / time
    }
    
    func checkAnswer() -> Bool{
        if quizDecNumber == ansDecNumber {
            return true
        } else {
            return false
        }
    }
    
    mutating func makeQuiz() -> String {
        quizDecNumber = String(Int.random(in: 1...255))
        return quizDecNumber
    }
    
    mutating func changeAnswer(place: Int, number: String) {
        self.byteArr[place] = number
        changeBynaryToDecimal()
    }
    
    mutating func changeBynaryToDecimal() {
        let byte = byteArr.joined()
        ansDecNumber = String(Int(byte, radix: 2)!)
    }
    
}
