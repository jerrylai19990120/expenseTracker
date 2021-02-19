//
//  ProfileView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle().fill(Color("bgPurple"))
                Rectangle().fill(Color.white)
            }
            
            VStack {
                
                Text("User Profile").foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold, design: .default)).padding(.top, 120)
                    .padding(.bottom, 20)
                Image(systemName: "person.fill")
                    .resizable().aspectRatio(contentMode: .fit)
                .clipped()
                    .frame(width: 60, height: 60)
                .padding()
                    .background(Color.white)
                    .cornerRadius(60)

                
                HStack {
                    Text("Hello,")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .thin, design: .default))
                    
                    Text("User")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium, design: .default))
                }.padding()
                    .padding(.bottom, 26)
                
                VStack {
                    Text("$ 39,000")
                        .font(.system(size: 38, weight: .medium, design: .rounded))
                    Text("CURRENT BALANCE")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                }.padding()
                .frame(width: 376, height: 80)
                    .background(Color.white)
                .cornerRadius(12)
                    .shadow(color: .gray, radius: 6)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                    }.padding()
                }
                
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
