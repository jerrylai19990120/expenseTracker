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
            VStack(alignment: .center, spacing:48) {
                
                VStack(alignment: .center, spacing: 48) {
    
                    Image("bg")
                        .resizable()
                        .frame(width: 366, height: 488)
                        .clipped()
                        .cornerRadius(25)
                        .scaledToFit()
                    
                    Text("Best way to track Your Expense!")
                        .font(Font.system(size: 16, weight: .medium, design: .monospaced))
                    
                }
                
                
                VStack(alignment: .center, spacing: 20) {
                        
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: SignInView(isSignUp: false).navigationBarTitle("")
                        .navigationBarHidden(true)) {
                            Text("SIGN IN")
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top:18, leading: 136, bottom: 18, trailing: 128))
                                .background(Color(red: 149/255, green: 80/255, blue: 230/255))
                                .cornerRadius(10)
                        }
                        
                        
                        
                    }
                    
                    
                    
                    Button(action: {}) {
                        
                        NavigationLink(destination: SignInView(isSignUp: true).navigationBarTitle("")
                        .navigationBarHidden(true)) {
                            Text(/*@START_MENU_TOKEN@*/"SIGN UP"/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(red: 149/255, green: 80/255, blue: 230/255))
                                .padding(EdgeInsets(top: 16, leading: 128, bottom: 16, trailing: 128))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10).stroke(Color(red: 149/255, green: 80/255, blue: 230/255), lineWidth: 1)
                            )
                        }
                    }
                   
                }
                Spacer()
                Spacer()
                
                
            }
            
            
        }.accentColor(Color("bgPurple"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
