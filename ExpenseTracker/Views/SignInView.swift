//
//  SignInView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            GeometryReader { gr in
                
                Image("signInbg")
                    .resizable()
                    .frame(width: gr.size.width*0.9,height: 360, alignment: .center)
                    .cornerRadius(20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .frame(height: gr.size.height*0.7)
                        .offset(y:300)
                    
                    SignInPanel()
                }
                
                
                
            }
            
                
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

