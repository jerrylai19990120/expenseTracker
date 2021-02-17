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
            //background stack
                VStack {
                    Image("signInbg")
                        .resizable()
                        .frame(width: 360, height: 360, alignment: .center)
                        .offset(y:60)
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .frame(height: gr.size.height*0.7)
                        .offset(y: 80)
                            
                }
            }
                
                //sign in stack
                
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
