//
//  TabNavView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct TabNavView: View {
    
    @State var isNightMode = false
    
    var body: some View {
        GeometryReader {
            gr in
            NavigationView {
                TabView {
                    
                    HomeView(gr: gr, isNightMode: self.$isNightMode)
                        .tabItem {
                            VStack {
                                Image(systemName: "house")
                                Text("HOME")
                            }
                    }.navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    HistoryView(gr: gr, isNightMode: self.$isNightMode)
                        .tabItem {
                            VStack {
                                Image(systemName: "clock")
                                Text("HISTORY")
                            }
                    }.navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    
                    ChartsView(gr: gr, isNightMode: self.$isNightMode)
                        .tabItem{
                            VStack {
                                Image(systemName: "chart.pie")
                                Text("CHARTS")
                            }
                    }.navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    ProfileView(gr: gr, isNightMode: self.$isNightMode)
                        .tabItem {
                            VStack {
                                Image(systemName: "person")
                                Text("PROFILE")
                            }
                    }.navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    
                }.onAppear(){
                    if self.isNightMode {
                        UITabBar.appearance().barTintColor = UIColor.black
                    } else {
                        UITabBar.appearance().backgroundColor = UIColor.purple
                        
                    }
                    
                    }.accentColor(Color("bgPurple"))
            }
            
        }
        
        
        
    }
    
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavView()
    }
}
