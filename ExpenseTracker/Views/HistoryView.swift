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
            
            VStack {
                Rectangle().fill(Color("bgPurple"))
            }
            
            VStack(spacing: 0) {
                
                VStack {
                    HStack(spacing: 230) {
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

            }.padding(.top, 100)
            
        }
        

    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
