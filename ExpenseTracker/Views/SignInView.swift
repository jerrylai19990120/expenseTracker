//
//  SignInView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @State var isSignUp = false
    var signUp = false
    
    init(isSignUp: Bool){
        self.signUp = isSignUp
    }
    
    var body: some View {
        ZStack {
            GeometryReader { gr in
                
                Image("signIn")
                    .resizable()
                    .frame(width: gr.size.width, height: 460, alignment: .center)
                    .offset(y: -60)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .frame(height: gr.size.height)
                        
                        
                    SignUpPanel(isSignUp: self.$isSignUp)
                        
                }.offset(y: self.isSignUp ? 46 :gr.size.height+80)
                        .animation(.default)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .frame(height: gr.size.height*0.76)
                        
                        
                    SignInPanel(isSignUp: self.$isSignUp)
                        
                }.offset(y: !self.isSignUp ? 254 : gr.size.height+80)
                    .animation(.default)
                
            }
            
                
        }.onAppear(){
            if self.signUp {
                self.isSignUp = true
            } else {
                self.isSignUp = false
            }
        }
    }
    
}

/*struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
*/
