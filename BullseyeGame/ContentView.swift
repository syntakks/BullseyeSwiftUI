//
//  ContentView.swift
//  BullseyeGame
//
//  Created by Stephen Wall on 1/29/20.
//  Copyright © 2020 Stephen Wall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let maxValue: Int = 100
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var currentScore: Int = 0
    @State var currentRound: Int = 1
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
                Text("\(target)").modifier(LabelStyle())
            }
            Spacer()
            // Slider Row
            HStack {
                Text("1")
                    .foregroundColor(Color.white)
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
                    .foregroundColor(Color.white)
            }
            Spacer()
            // Hit Button
            Button(action: {
                //print("Button Pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                let roundedValue: Int = Int(sliderValue.rounded())
                let diff = diffOfCurrentRound()
                let title = alertTitle(diff: diff)
                let score = pointsForCurrentRound()
                return Alert(title: Text("\(title)"),
                             message: Text("The sliders value is: \(roundedValue)\n" +
                                "Difference of: \(diff)\n" +
                                "You scored: \(score) points this round."),
                             dismissButton: .default(Text("Awesome!"), action: {
                                self.updateScoreAndRound(score: score)
                             }))
            }
            Spacer()
            // Info Stack
            HStack {
                Button(action: {
                    // Start over
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score: ").modifier(LabelStyle())
                Text("\(currentScore)").modifier(LabelStyle())
                Spacer()
                Text("Round").modifier(LabelStyle())
                Text("\(currentRound)").modifier(LabelStyle())
                Spacer()
                Button(action: {
                    // Info
                }) {
                    Text("Info")
                }
            } .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
    }
    
    func diffOfCurrentRound() -> Int {
        let roundedValue: Int = Int(sliderValue.rounded())
        let diff = abs(target - roundedValue)
        return diff
    }
    
    func pointsForCurrentRound () -> Int {
        var bonus = 0
        let diff = diffOfCurrentRound()
        switch diff {
        case 0: bonus = 100
        case 1: bonus = 50
        default:bonus = 0
        }
        let score = (maxValue - diff) + bonus
        return score
    }
    
    func alertTitle(diff: Int) -> String {
        switch diff {
        case 0: return "Perfect!"
        case 1...3: return "Ohhh so close!"
        case 4...10: return "Not Bad!"
        case 11...20: return "Meh.. Try again..."
        default: return "Are you even trying?!"
        }
    }
    
    func updateScoreAndRound(score: Int) {
        currentRound += 1
        currentScore += score
        target = Int.random(in: 1...100)
    }
}

// To preview app in landscape add the .previewLayout method as below:
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewLayout(
            .fixed(width: 896, height: 414))
    }
}
