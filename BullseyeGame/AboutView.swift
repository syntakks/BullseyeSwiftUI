//
//  AboutView.swift
//  BullseyeGame
//
//  Created by Stephen Wall on 1/30/20.
//  Copyright © 2020 Stephen Wall. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let backgroundColor = Color(red: 1, green: 214 / 255.0, blue: 179 / 255.0)
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.bottom, 20)
                .padding(.top, 20)
        }
    }
    
    struct TextViewStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                //Heading
                Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                // Text Views
                Text("This is Bullseye. The game where you can win points and earn fame by dragging a slider.").modifier(TextViewStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextViewStyle())
                Text("Enjoy!").modifier(TextViewStyle())
            }
            .navigationBarTitle("About Bullseye").background(backgroundColor)
        }.background(Image("Background"))
        
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
        .previewLayout(
            .fixed(width: 896, height: 414))
    }
}
