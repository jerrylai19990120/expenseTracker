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
    
    @State var signUpSuccess = false
    
    var gr: GeometryProxy
    
    var body: some View {
        VStack(alignment: .center, spacing: gr.size.height*0.01) {
            
            Text("Sign Up")
                .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
            
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                TextField("Username", text: $username)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                
                Text("Email Address")
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                TextField("email address", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                Text("Password")
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                
                
                SecureField("password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                    
                
            }.padding([.leading, .trailing], 36)
            
            VStack(spacing: gr.size.height*0.04) {
                
                VStack(alignment: .leading) {
                    Text("Confirm Password")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                    SecureField("confirm password", text: $confirmPassword)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                    
                    
                }.padding([.leading, .trailing], 36)
                
                VStack {
                    
                    NavigationLink(destination: TabNavView(gr: gr), isActive: $signUpSuccess){
                        Button(action: {
                            AuthService.instance.createUser(email: self.email, password: self.password) { (success) in
                                if success {
                                    self.signUpSuccess = true
                                }
                            }
                        }){
                            
                            Text("Sign Up")
                                .frame(width: gr.size.width*0.8, height: gr.size.height*0.07)
                                .background(Color("bgPurple"))
                                .foregroundColor(.white)
                                .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                                .cornerRadius(10)
                            
                            
                        }.padding()
                    }
                    
                    
                    HStack {
                        Text("I'm already a member.")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                        
                            
                            Text("Sign In")
                                .foregroundColor(Color("bgPurple"))
                                .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default)).onTapGesture {
                                    self.isSignUp.toggle()
                                    
                            }
                        
                        
                    }.padding()
                    
                    NavigationLink(destination: WelcomeView().navigationBarTitle("").navigationBarHidden(true)) {
                        Text("Cancel")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    }.padding()
                    
                }
            }
            
            
            
            
        }
    }
}

struct SignUpPanel_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { gr in
            SignUpPanel(isSignUp: .constant(false), gr: gr)
        }
        
    }
}
