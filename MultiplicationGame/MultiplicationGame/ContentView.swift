//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Wesley Patterson on 8/11/22.
//

import SwiftUI
struct Question {
    let text: String
    let answer: Int
}


struct ContentView: View {
    @State private var startGame = true
    @State private var righOrWrong = ""
    @State private var playerAnswer = 0
    @State private var actualAnswer = 0
    @State private var score = 0
    
    @State private var multiplicationTables = Range(1...12)
    @State private var arr = [Question(text: "1 x 1", answer: 1)]
    
    
    
    var body: some View {
        
        if startGame {
            ZStack {
                LinearGradient(colors: [.indigo, .white], startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Text("Score: \(score)")
                    .padding(35)
                Text("Question \(arr[0].text)")
                    .padding(20)
                
                TextField("Answer", value: $playerAnswer, format: .number).padding(.leading, 25.0)
                    .padding(25)
            
                Button("Submit") {
                    checker(answer: $playerAnswer)
                    self.arr.shuffle()
                }
                
            }
            
         }
        } else {
            ZStack {
                LinearGradient(colors: [.pink, .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack {
                    
                    Button("Are you ready?") {
                        startGame = true
                        mulitplicationTable()
                    }
                    .padding()
                    .background(.white)
                    .clipShape(Capsule())
                    .padding(5)
                    .overlay{
                        Capsule().stroke(Color.white, lineWidth: 2)
                            
                    }
                    .foregroundColor(.black)
                }
                
            }
            
        }
           
        
    }
    
    func checker(answer : Int) {
        var question : Question = self.arr[0]
        if answer ==  {
            score += 1
        } else {
            score += 1
        }
    }
    
    func mulitplicationTable() {
        for i in 1...7 {
            for j in 1...12 {
                let newQuestion = Question(text: "what is \(i) * \(j)", answer: i * j)
                arr.append(newQuestion)
            }
            self.arr.shuffle()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
