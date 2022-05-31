//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Wesley Patterson on 5/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rockPaperScissors = ["Rock", "Paper", "Scissors"]
    @State private var random = Int.random(in: 0...2)
    @State private var worL = Bool.random()
    @State private var score = 0
    @State private var title = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("\(title)")
                        .font(.title)
                        
                    Text("\(score)")
                        .font(.largeTitle)
                        HStack {
                            Text(worL ? "Win against " : "Lose against ")
                                .font(.title2)
                            .fontWeight(.heavy)
                            Text(rockPaperScissors[random])
                                .font(.title)
                        }
                        HStack {
                            ForEach(0..<3) { number in
                                Button {
                                    buttonPressed(number: number)
                                } label: {
                                    Text("\(rockPaperScissors[number])")
                                        .frame(width: 100, height: 50)
                                            .foregroundColor(Color.white)
                                            .background(worL ? .blue : .red)
                                            .clipShape(Capsule())
                                        
                                }
                            }
                        }
                    
                }
            }
            .navigationTitle("Rock Paper Scissors")
        }
        
    }
    func buttonPressed(number: Int) {
        if number == random + 1 {
            if worL {
                title = "You win!"
                score += 1
            } else {
                title = "You lose :("
            }
            
        } else if number == 0 && random == 2 {
            if worL {
                title = "You win!"
                score += 1
            } else {
                title = "You lose :("
            }
        } else if number == random + 2 {
            if worL {
                title = "You Lose..."
            } else {
                title = "You Win!"
                score += 1
            }
        } else if number == 0 && random == 1 {
            if worL {
                title = "You Lose..."
            } else {
                title = "You Win!"
                score += 1
            }
        } else if number == random {
            title = "You Lose!"
        }
        random = Int.random(in: 0...2)
        worL.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
