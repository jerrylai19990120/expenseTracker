//
//  HistoryView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import Firebase

struct HistoryView: View {
    
    @State var query = ""
    
    var gr: GeometryProxy
    
    @State var popup = false
    
    @State var transactions: [Transaction] = [Transaction]()
    
    @Binding var isNightMode: Bool
    
    var body: some View {
        ZStack {
            
            if isNightMode {
                Color(red: 39/255, green: 31/255, blue: 31/255)
            } else {
                Color("bgPurple")
            }
            
            if transactions.count == 0 {
                EmptyTransactionView(gr: gr)
            }
            
            
            VStack(spacing: 0) {
                
                VStack {
                    HStack(spacing: 230) {
                        Text("History")
                            .foregroundColor(isNightMode ? Color.orange : Color.white)
                            .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
                        
                        Image(systemName: "plus.circle")
                            .resizable()
                            .clipped()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                            .foregroundColor(isNightMode ? Color.orange : Color.white)
                            .onTapGesture {
                                self.popup.toggle()
                        }
                        
                        
                    }.padding(.top, gr.size.height*0.03)
                    
                    

                }.padding()
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                            
                        ForEach(transactions, id: \.self) {
                            item in
                            HistoryItem(gr: self.gr, date: item.date, note: item.note, amount: item.amount, isIncome: item.isIncome, category: item.category, isNightMode: self.$isNightMode)
                        }
                            
                    }
                }.background(isNightMode ? Color(red: 64/255, green: 64/255, blue: 64/255) : Color.white)
                
                
                
                
                

            }.padding(.top, gr.size.height*0.04)
            
            VStack {
                Spacer()
                AddActivityView(gr: gr, popup: $popup, isNightMode: $isNightMode)
            }.offset(y: popup ? gr.size.height*0.018 : gr.size.height + 88)
                .animation(.default)
            
        }.edgesIgnoringSafeArea(.all)
            .onAppear {
                DataService.instance.getAllTransactions(uid: Auth.auth().currentUser!.uid) { (success) in
                    if success {
                        self.transactions = DataService.instance.transactions
                    }
                }
        }
    
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HistoryView(gr: gr, isNightMode: .constant(false))
        }
        
    }
}
