//
//  ContentView.swift
//  EdutainmentApp
//
//  Created by BCCS 2022 on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    struct Question {
        var question: String
        var answer: Int
    }
    
    @State private var questions = [Question]()
        
    @State private var questionNumber = 0
    
    @State private var number = 0
    
    @State private var multiple = 0
    
    @State private var message = "Select a Multiple to start the game"
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Form {
                Picker("Answer", selection: $number){
                    ForEach(0..<100){
                        Text("\($0)")
                    }
                }
                
                Button {
                    
                    guess()
                    
                } label: {
                    
                    Text("Submit Answer")
                }
            }

            Spacer()
            
            Form {
                
                Picker("Multiple", selection: $multiple){
                    
                    ForEach(0..<10){
                        
                        Text("\($0)")
                        
                    }
                }
                
                Button {
                    startGame()
                } label: {
                    Text("Submit Mutiple")
                }
            }
            
            Button {
                nextQuestion()
            } label: {
                Text("NEXT QUESTION")
            }
            
            Spacer()
            
        }
    }
    
    func guess(){
        //if there arent any questions left, tell em
        if questionNumber >= questions.count {
            message = "aint nothin left"
        } else {
            let currentQuestion = questions[questionNumber]
            //if choice = answer, good, otherwise bade
            if number == currentQuestion.answer {
                message = "correct nice"
            } else {
                message = "naw sorry"
            }
        }

    }
//go to next question, otherwise end game and let them start again
    func nextQuestion(){
        if questionNumber + 1 < questions.count {
            questionNumber += 1
            message = questions[questionNumber].question
        } else {
            message = "Game over! Select a multiple to start again."
            questionNumber = 0
            questions = []
        }
        
    }
    
//adds questions based on multiple and i, appends to questions with an answer
    func startGame(){
        questions = []
            for i in 1...10 {
                let questionTexta = "\(multiple) x \(i)"
                let answerValuea = multiple * i
                questions.append(Question(question: questionTexta, answer: answerValuea))
            }
            questionNumber = 0
            if !questions.isEmpty {
                message = questions[questionNumber].question
            } else {
                message = "Please select multiple to start."
            }
        
    }
}

#Preview {
    ContentView()
}
