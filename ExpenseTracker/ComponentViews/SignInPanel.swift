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
        
        VStack(alignment: .center) {
            
            Text("Sign In")
                .font(.system(size: 24, weight: .bold, design: .default))
            
            VStack(alignment: .leading) {
                Text("Email Address")
                TextField("email address", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                TextField("password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .trailing) {
                Text("Forgot Password?")
                Button(action: {}){
                    Text("Sign In")
                    
                }
            }
            
            HStack {
                Text("I'm a new user.")
                Text("Sign Up")
            }
        }
    }
}

struct SignInPanel_Previews: PreviewProvider {
    
    static var previews: some View {
        SignInPanel()
    }
    
}
