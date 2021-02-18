//
//  HistoryView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        ZStack {
            Color("bgPurple")
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HistoryItem()
                }
            }
            /*VStack {
                Spacer()
                HStack {
                    Text("History")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold, design: .default))
                    
                    Image(systemName: "plus.circle")
                        .resizable()
                        .clipped()
                        .frame(width: 60, height: 60)
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HistoryItem()
                        HistoryItem()
                    }
                }

            }*/
            
            
            
            
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
