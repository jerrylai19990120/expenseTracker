//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                Rectangle().fill(                LinearGradient(gradient: Gradient(colors: [Color("bgPurple"), .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))

                Rectangle().fill(Color.white)
            }
            
            
            VStack(spacing: 0) {
                Spacer()
                
                MainStatusView(gr: gr)
                    
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                        
                    }.padding().padding(.bottom, gr.size.height*0.1)
                    
                }
                
            }.padding(.top)
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HomeView(gr: gr)
        }
        
    }
}


