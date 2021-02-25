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
    
    var gr: GeometryProxy
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 6) {
            Spacer()
            Text("Sign In")
                .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
            //Spacer()
            VStack(alignment: .leading) {
                Text("Email Address")
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                TextField("email address", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: gr.size.height*0.05)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                
            }.padding([.leading, .trailing], gr.size.width*0.1)
            
            VStack(spacing: gr.size.height*0.06) {
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .trailing) {
                        SecureField("password", text: $password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(height: gr.size.height*0.05)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("bgPurple"), lineWidth: 1))
                        
                        
                        Text("Forgot Password?")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    }
                    
                    
                }.padding([.leading, .trailing], gr.size.width*0.1)
                
                VStack(spacing: gr.size.height*0.06) {
                    
                    Button(action: {}){
                        
                        NavigationLink(destination: TabNavView()){
                            
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
