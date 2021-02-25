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
        GeometryReader { gr in
            NavigationView {
                
                VStack(alignment: .center) {
                    Spacer()
                    
                        
                    Image("bg")
                        .resizable()
                        .frame(width: gr.size.width*0.88, height: gr.size.height*0.6)
                        .clipped()
                        .cornerRadius(25)
                        .scaledToFit()
                    Spacer()
                    Text("Best way to track Your Expense!")
                        .font(Font.system(size: gr.size.width*0.042, weight: .medium, design: .monospaced))
                    
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: gr.size.height*0.02) {
                        
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination: SignInView(isSignUp: false).navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    Text("SIGN IN")
                                        .foregroundColor(.white)
                                        .frame(width: gr.size.width*0.88, height: gr.size.height*0.08)
                                        .background(Color(red: 149/255, green: 80/255, blue: 230/255))
                                        .cornerRadius(10)
                            }
                            
                            
                            
                        }
                        
                        
                        Button(action: {}) {
                            
                            NavigationLink(destination: SignInView(isSignUp: true).navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    Text(/*@START_MENU_TOKEN@*/"SIGN UP"/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color(red: 149/255, green: 80/255, blue: 230/255))
                                        .frame(width: gr.size.width*0.88, height: gr.size.height*0.08)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10).stroke(Color(red: 149/255, green: 80/255, blue: 230/255), lineWidth: 1)
                                    )
                            }
                        }
                        
                    }
                    
                    Spacer()
                }.edgesIgnoringSafeArea(.all)
                
                
            }.accentColor(Color("bgPurple"))
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
