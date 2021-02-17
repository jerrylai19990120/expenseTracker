//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-13.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var selection: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Image("bg")
                    .resizable()
                    .frame(width: 336, height: 400)
                    .clipped()
                    .cornerRadius(25)
                    .scaledToFit()
                Spacer()
                Text("Best way to track Your Expense!")
                .font(Font.system(size: 16, weight: .bold, design: .monospaced))
                Spacer()
                
                Button(action: {
                    self.selection = 1
                }) {
                    Text("SIGN IN")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 128, bottom: 10, trailing: 128))
                    .background(Color(red: 149/255, green: 80/255, blue: 230/255))
                    .cornerRadius(10)
                }
                
                Spacer()
                Button(action: {}) {
                    Text(/*@START_MENU_TOKEN@*/"SIGN UP"/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(red: 149/255, green: 80/255, blue: 230/255))
                    .padding(EdgeInsets(top: 10, leading: 128, bottom: 10, trailing: 128))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color(red: 149/255, green: 80/255, blue: 230/255), lineWidth: 1)
                    )
                    
                }
                Spacer()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
