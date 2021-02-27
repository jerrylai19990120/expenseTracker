//
//  SignUpPanel.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SignUpPanel: View {
    
    //user info
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    //error messages
    @State var usernameErr = ""
    @State var emailErr = ""
    @State var passwordErr = ""
    @State var confirmPasswordErr = ""
    
    @Binding var isSignUp: Bool
    
    //check if sign up is successfult
    @State var signUpSuccess = false
    
    var gr: GeometryProxy
    
    var body: some View {
        VStack(alignment: .center, spacing: gr.size.height*0.01) {
            
            Text("Sign Up")
                .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Username")
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                    Spacer()
                    Text("\(self.usernameErr)")
                    .font(.system(size: gr.size.width*0.03, weight: .light, design: .default))
                    .foregroundColor(.red)
                }
                
                TextField("Username", text: $username)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(usernameErr=="" ? Color("bgPurple") : Color.red, lineWidth: 1))
                
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
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(emailErr=="" ? Color("bgPurple") : Color.red, lineWidth: 1))
                
                HStack {
                    Text("Password")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(self.passwordErr)")
                    .font(.system(size: gr.size.width*0.03, weight: .light, design: .default))
                    .foregroundColor(.red)
                }
                
                
                
                SecureField("password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(passwordErr=="" ? Color("bgPurple") : Color.red, lineWidth: 1))
                    
                
            }.padding([.leading, .trailing], 36)
            
            VStack(spacing: gr.size.height*0.04) {
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Confirm Password")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("\(self.confirmPasswordErr)")
                        .font(.system(size: gr.size.width*0.03, weight: .light, design: .default))
                        .foregroundColor(.red)
                    }
                    
                    SecureField("confirm password", text: $confirmPassword)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.02)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(confirmPasswordErr=="" ? Color("bgPurple") : Color.red, lineWidth: 1))
                    
                    
                }.padding([.leading, .trailing], 36)
                
                VStack {
                    
                    NavigationLink(destination: TabNavView(), isActive: $signUpSuccess){
                        Button(action: {
                            self.emailErr = ""
                            self.usernameErr = ""
                            self.passwordErr = ""
                            self.confirmPasswordErr = ""
                            if self.validateInputs() {
                                AuthService.instance.createUser(email: self.email, password: self.password, username: self.username) { (success) in
                                    
                                    if success {
                                        self.signUpSuccess = true
                                    } else {
                                        if AuthService.instance.signUpErrCode == 1 {
                                            self.emailErr = "email is invalid"
                                        } else if AuthService.instance.signUpErrCode == 2 {
                                            self.passwordErr = "password must be 6 characters or longer"
                                        } else if AuthService.instance.signUpErrCode == 3 {
                                            self.emailErr = "email already in used"
                                        }
                                    }
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
    
    func validateInputs()->Bool {
        
        var result: Bool = true
        
        if username == "" {
            usernameErr = "Field cannot be empty"
            result = false
        }
        
        if email == "" {
            emailErr = "Field cannot be empty"
            result = false
        }
        
        if password == "" {
            passwordErr = "Field cannot be empty"
            result = false
        }
        
        if confirmPassword == "" {
            confirmPasswordErr = "Field cannot be empty"
            result = false
        }
        
        if password != confirmPassword {
            confirmPasswordErr = "password does not match"
            result = false
        }
        
        return result
    }
}

struct SignUpPanel_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { gr in
            SignUpPanel(isSignUp: .constant(false), gr: gr)
        }
        
    }
}
