//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    var gr: GeometryProxy
    
    @State var balance: Int = -1
    @State var income: Int = -1
    @State var expense: Int = -1
    
    @State var recentTransactions: [Transaction] = [Transaction]()
    
    init(gr: GeometryProxy) {
        self.gr = gr
    }
    
    
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                Rectangle().fill(                LinearGradient(gradient: Gradient(colors: [Color("bgPurple"), .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))

                Rectangle().fill(Color.white)
            }
            
            
            VStack(spacing: 0) {
                Spacer()
                
                MainStatusView(gr: gr, balance: $balance, income: $income, expense: $expense)
                    
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                        ForEach(recentTransactions, id: \.self){
                            item in
                            ExpenseItem(gr: self.gr, date: item.date, note: item.note, amount: item.amount, isIncome: item.isIncome, category: item.category)
                        }
                        
                    }.padding().padding(.bottom, gr.size.height*0.1)
                    
                }
                
                }.padding(.top)
                .onAppear {
                    DataService.instance.retrieveUser(uid: Auth.auth().currentUser!.uid) { (success) in
                        if success {
                            self.balance = DataService.instance.user!.balance
                            self.income = DataService.instance.user!.income
                            self.expense = DataService.instance.user!.expense
                            
                        }
                    }
            }
            
            
        }.edgesIgnoringSafeArea(.all)
            .onAppear {
                DataService.instance.getAllTransactions(uid: Auth.auth().currentUser!.uid) { (success) in
                    if success {
                        self.recentTransactions = DataService.instance.recentTransactions
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HomeView(gr: gr)
        }
        
    }
}


