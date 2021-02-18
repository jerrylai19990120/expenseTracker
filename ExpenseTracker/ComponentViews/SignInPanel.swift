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
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 40) {
            
            Text("Sign In")
                .font(.system(size: 24, weight: .bold, design: .default))
            
            VStack(alignment: .leading) {
                Text("Email Address")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                TextField("email address", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }.padding([.leading, .trailing], 36)
            
            VStack(alignment: .leading) {
                Text("Password")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                
                VStack(alignment: .trailing) {
                    TextField("password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Forgot Password?")
                    .font(.system(size: 16, weight: .medium, design: .default))
                }
                
                
            }.padding([.leading, .trailing], 36)
            
            VStack(spacing: 66) {
               
                Button(action: {}){
                    Text("Sign In")
                        .padding(EdgeInsets(top: 18, leading: 138, bottom: 18, trailing: 138))
                        .background(Color("bgPurple"))
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium, design: .default))
                    .cornerRadius(10)
                    
                }
                
                HStack {
                    Text("I'm a new user.")
                        .font(.system(size: 16, weight: .medium, design: .default))
                    Text("Sign Up")
                        .foregroundColor(Color("bgPurple"))
                        .font(.system(size: 16, weight: .medium, design: .default))
                }
                
            }
            
            
        }
    }
}

struct SignInPanel_Previews: PreviewProvider {
    
    static var previews: some View {
        SignInPanel()
    }
    
}
