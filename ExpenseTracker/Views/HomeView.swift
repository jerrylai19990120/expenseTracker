//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                Rectangle().fill(                LinearGradient(gradient: Gradient(colors: [Color("bgPurple"), .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))

                Rectangle().fill(Color.white)
            }
            
            
            VStack(spacing: 0) {
                Spacer()
                Spacer()
                MainStatusView()
                    
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        ExpenseItem()
                        
                    }.padding()
                }.offset(y: -63).frame(height: 480)
                
                
                Spacer()
            }.padding()
                .padding(.top, 70)
            
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


