//
//  TabNavView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct TabNavView: View {
    
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("HOME")
                    }
                }.navigationBarTitle("")
                .navigationBarHidden(true)
            
            HistoryView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                        Text("HISTORY")
                    }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            
            
            ChartsView()
                .tabItem{
                    VStack {
                        Image(systemName: "chart.pie")
                        Text("CHARTS")
                    }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("PROFILE")
                    }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            
            
        }.onAppear(){
            UITabBar.appearance().backgroundColor = UIColor(red: 251/255, green: 253/255, blue: 1, alpha: 1)
        }.accentColor(Color("bgPurple"))
        
        
    }
    
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavView()
    }
}
