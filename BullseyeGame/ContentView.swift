//
//  ContentView.swift
//  BullseyeGame
//
//  Created by Stephen Wall on 1/29/20.
//  Copyright © 2020 Stephen Wall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                Text("95")
            }
            Spacer()
            // Slider Row
            HStack {
                Text("1")
                Slider(value: .constant(10))
                Text("100")
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
                return Alert(title: Text("Hello There!"),
                             message: Text("This is my first pop-up"),
                             dismissButton: .default(Text("Awesome!")))
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
                Text("Score: ")
                Text("9999")
                Spacer()
                Text("Round")
                Text("999")
                Spacer()
                Button(action: {
                    // Info
                }) {
                    Text("Info")
                }
            } .padding(.bottom, 20)
        }
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
