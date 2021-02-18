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
            LinearGradient(gradient: Gradient(colors: [Color("bgPurple"), .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                MainStatusView().offset(y: 100)
                
                Rectangle().fill(Color.white).offset(y: 100)
            }
            
            
            VStack {
                ExpenseItem()
                ExpenseItem()
                ExpenseItem()
                ExpenseItem()
                ExpenseItem()

            }.offset(y: 166)
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


