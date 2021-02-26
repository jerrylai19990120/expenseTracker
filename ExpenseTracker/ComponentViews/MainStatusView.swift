//
//  MainStatusView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct MainStatusView: View {
    
    var gr: GeometryProxy
    
    let formatter = DateFormatter()
    
    @Binding var balance: Int
    @Binding var income: Int
    @Binding var expense: Int
    
    init(gr: GeometryProxy, balance: Binding<Int>, income: Binding<Int>, expense: Binding<Int>) {
        self.gr = gr
        self.formatter.dateFormat = "MMMM y"
        self._balance = balance
        self._expense = expense
        self._income = income
    }
    

    var body: some View {
        VStack(alignment: .center) {
            
            VStack(alignment: .center, spacing: gr.size.height*0.04) {
                Text("CURRENT BALANCE")
                    .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                HStack{
                    Text("$")
                        .font(.system(size: gr.size.width*0.09, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                    Text("\(balance)")
                        .font(.system(size: gr.size.width*0.12, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                }
                Text("\(formatter.string(from: Date()))")
                    .font(.system(size: gr.size.width*0.05, weight: .light, design: .default))
                    .foregroundColor(Color.white)
            }
            
            HStack {
                
                HStack(alignment: .firstTextBaseline, spacing: gr.size.height*0.02) {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: gr.size.height*0.01) {
                        Text("INCOME")
                            .font(.system(size: gr.size.width*0.044, weight: .light, design: .default))
                            .foregroundColor(Color.white)
                        Text("$\(income)")
                            .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
                HStack(alignment: .firstTextBaseline,spacing: gr.size.height*0.02) {
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: gr.size.height*0.01) {
                        Text("EXPENSE")
                            .font(.system(size: gr.size.width*0.044, weight: .light, design: .default))
                            .foregroundColor(Color.white)
                        Text("$\(expense)")
                            .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                            .foregroundColor(Color.white)
                    }
                }
                
            }
        }.padding()
            .frame(width: gr.size.width)
        
            
    }
}

struct MainStatusView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            gr in
            MainStatusView(gr: gr, balance: Binding.constant(0), income: Binding.constant(0), expense: Binding.constant(0))
        }
        
    }
}
