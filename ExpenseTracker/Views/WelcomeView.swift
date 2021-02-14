//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-13.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("bg")
                    .resizable()
                    .frame(width: 336, height: 400)
                    .clipped()
                    .cornerRadius(25)
                    .scaledToFit()
                
                Text("Best way to track Your Expense!")
                .font(Font.system(size: 16, weight: .bold, design: .monospaced))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("SIGN IN")
                }
                Button(action: {}) {
                    Text(/*@START_MENU_TOKEN@*/"SIGN UP"/*@END_MENU_TOKEN@*/)
                }.buttonStyle(ButtonStyle.Protocol.self)
            }.edgesIgnoringSafeArea(.all)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
