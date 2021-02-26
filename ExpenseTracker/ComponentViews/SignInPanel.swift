//
//  SignInPanel.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SignInPanel: View {
    
    @State var email = ""
    @State var password = ""
    
    @Binding var isSignUp: Bool
    
    @State var isLoggedIn = false
    
    @State var emailErr = ""
    @State var passwordErr = ""
    
    var gr: GeometryProxy
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 6) {
            Spacer()
            Text("Sign In")
                .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
            //Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text("Email Address")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(self.emailErr)")
                    .font(.system(size: gr.size.width*0.03, weight: .light, design: .default))
                    .foregroundColor(.red)
                }
                
                TextField("email address", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.05)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(emailErr=="" ? Color("bgPurple") : Color.red, lineWidth: 1))
                
            }.padding([.leading, .trailing], gr.size.width*0.1)
            
            VStack(spacing: gr.size.height*0.06) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Password")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("\(self.passwordErr)")
                        .font(.system(size: gr.size.width*0.03, weight: .light, design: .default))
                        .foregroundColor(.red)
                    }
                    
                    
                    VStack(alignment: .trailing) {
                        SecureField("password", text: $password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(height: gr.size.height*0.05)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(passwordErr=="" ? Color("bgPurple") : Color.red, lineWidth: 1))
                        
                        
                        Text("Forgot Password?")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    }
                    
                    
                }.padding([.leading, .trailing], gr.size.width*0.1)
                
                VStack(spacing: gr.size.height*0.06) {
                    
                    NavigationLink(destination: TabNavView(gr: gr), isActive: $isLoggedIn){
                        
                        Button(action: {
                            AuthService.instance.loginUser(email: self.email, password: self.password) { (success) in
                                self.emailErr = ""
                                self.passwordErr = ""
                                if success {
                                    self.isLoggedIn = true
                                } else {
                                    if AuthService.instance.errorCode == 1 {
                                        self.emailErr = "email is invalid"
                                    } else if AuthService.instance.errorCode == 2 {
                                        self.passwordErr = "password is invalid"
                                    } else if AuthService.instance.errorCode == 3 {
                                        self.emailErr = "user is not found"
                                    }
                                }
                            }
                        }){
                            
                            Text("Sign In")
                                .padding()
                                .frame(width: gr.size.width*0.8)
                                .background(Color("bgPurple"))
                                .foregroundColor(.white)
                                .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                                .cornerRadius(10)
                            
                        }
                    }
                    
                    
                    HStack {
                        Text("I'm a new user.")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                        
                        
                        Text("Sign Up")
                            .foregroundColor(Color("bgPurple"))
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default)).onTapGesture {
                                    self.isSignUp.toggle()
                            }
                        
                    }
                    
                    NavigationLink(destination: WelcomeView().navigationBarTitle("").navigationBarHidden(true)) {
                        Text("Cancel")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    }
                    
                }
            }
            
            
           Spacer()
            
        }
    }
}

struct SignInPanel_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { gr in
            SignInPanel(isSignUp: .constant(false), gr: gr)
        }
        
    }
    
}
