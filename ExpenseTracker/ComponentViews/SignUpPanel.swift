//
//  SignUpPanel.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SignUpPanel: View {
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @Binding var isSignUp: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Text("Sign Up")
                .font(.system(size: 24, weight: .bold, design: .default))
                .offset(y:-20)
            
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                TextField("Username", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 38)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                
                Text("Email Address")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                TextField("email address", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 38)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                Text("Password")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                
                
                SecureField("password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 38)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                    
                    
                
                
                
            }.padding([.leading, .trailing], 36)
            
            VStack(spacing: 40) {
                
                VStack(alignment: .leading) {
                    Text("Confirm Password")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                    SecureField("confirm password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 38)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                    
                    
                }.padding([.leading, .trailing], 36)
                
                VStack(spacing: 54) {
                    
                    Button(action: {}){
                        
                        NavigationLink(destination: TabNavView()){
                            
                            Text("Sign Up")
                                .padding(EdgeInsets(top: 18, leading: 138, bottom: 18, trailing: 138))
                                .background(Color("bgPurple"))
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .cornerRadius(10)
                        }
                        
                        
                    }
                    
                    HStack {
                        Text("I'm already a member.")
                            .font(.system(size: 16, weight: .medium, design: .default))
                        
                            
                            Text("Sign In")
                                .foregroundColor(Color("bgPurple"))
                                .font(.system(size: 16, weight: .medium, design: .default)).onTapGesture {
                                    self.isSignUp.toggle()
                                    
                            }
                        
                        
                    }
                    
                    NavigationLink(destination: WelcomeView().navigationBarTitle("").navigationBarHidden(true)) {
                        Text("Cancel")
                        .font(.system(size: 16, weight: .medium, design: .default))
                    }
                    
                }
            }
            
            
            
            
        }
    }
}

struct SignUpPanel_Previews: PreviewProvider {
    
    static var previews: some View {
        SignUpPanel(isSignUp: .constant(false))
    }
}
