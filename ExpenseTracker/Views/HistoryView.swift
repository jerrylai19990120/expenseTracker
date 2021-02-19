//
//  HistoryView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @State var query = ""
    
    var body: some View {
        ZStack {
            Color("bgPurple")
            VStack(spacing: 0) {
                
                VStack {
                    HStack(spacing: 250) {
                        Text("History")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold, design: .default))
                        
                        Image(systemName: "plus.circle")
                            .resizable()
                            .clipped()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        
                        
                    }
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .aspectRatio(contentMode: .fit)
                        TextField("Search history", text: $query)
                        
                        }.padding()
                        .frame(height: 54)
                        .background(Color.white)
                        .cornerRadius(30)

                }.padding()
                
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                        HistoryItem()
                    }
                }

            }.offset(y: 160)
            
        }.edgesIgnoringSafeArea(.all)
        

    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
