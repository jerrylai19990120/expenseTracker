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
    
    var gr: GeometryProxy
    
    @State var popup = false
    
    @State var transactions = [
        Transaction(category: "Food & Drinks", note: "Buy KFC", date: "May 20, 2020", amount: 20, isIncome: true),
        
        Transaction(category: "Clothing", note: "Buy pants", date: "May 20, 2020", amount: 210, isIncome: false),
        Transaction(category: "Clothing", note: "Buy pants", date: "May 20, 2020", amount: 210, isIncome: false),
        Transaction(category: "Other", note: "Bitcoin", date: "May 20, 2020", amount: 1010, isIncome: true)
        
    ]
    
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
                            .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
                        
                        Image(systemName: "plus.circle")
                            .resizable()
                            .clipped()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                            .foregroundColor(.white)
                            .onTapGesture {
                                self.popup.toggle()
                        }
                        
                        
                    }
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .aspectRatio(contentMode: .fit)
                        TextField("Search history", text: $query)
                        
                        }.padding()
                        .background(Color.white)
                        .cornerRadius(30)

                }.padding()
                
                if transactions.count == 0 {
                    EmptyTransactionView(gr: gr)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            
                            ForEach(transactions, id: \.self) {
                                item in
                                HistoryItem(gr: self.gr, date: item.date, note: item.note, amount: item.amount, isIncome: item.isIncome, category: item.category)
                            }
                            
                        }
                    }.background(Color.white)
                }
                
                
                
                

            }.padding(.top, gr.size.height*0.04)
            
            VStack {
                Spacer()
                AddActivityView(gr: gr, popup: $popup)
            }.offset(y: popup ? gr.size.height*0.03 : gr.size.height + 88)
                .animation(.default)
            
        }.edgesIgnoringSafeArea(.all)
    
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HistoryView(gr: gr)
        }
        
    }
}
