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
                }
            
            HistoryView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                        Text("HISTORY")
                    }
            }
            
            AddActivityView()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                            .resizable()
                            .clipped()
                            .aspectRatio(contentMode: .fit)
                        
                    }
            }
            
            ChartsView()
                .tabItem{
                    VStack {
                        Image(systemName: "chart.pie")
                        Text("CHARTS")
                    }
            }
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("PROFILE")
                    }
            }
            
            
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
