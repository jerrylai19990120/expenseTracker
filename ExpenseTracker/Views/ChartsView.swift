//
//  ChartsView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ChartsView: View {
    
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 247/255, blue: 249/255)
            
            VStack {
                
                
                HStack(spacing: 90) {
                    Text("Expense Analysis")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold, design: .default))
                    
                    Image(systemName: "moon.circle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .clipped()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        
                    
                    

                }.frame(width: 400)
                .padding()
                    .padding(.top, 100)
                .background(Color("bgPurple"))
                    
                Spacer()
                
            
                
                VStack(spacing: 26) {
                    Spacer()
                        
                    MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.orngPink), ([90,99,78,111,70,60,77], GradientColors.purple)], title: "Income VS. Expense", form: ChartForm.large)
                        
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)]), title: "Income", legend: "Monthly")
                            
                            PieChartView(data: [8,23,54,32], title: "Category", legend: "Cumulative")
                            
                            LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Expense", legend: "Monthly", form: ChartForm.detail)
                        }.padding()
                        
                    }
                    
                    
                   Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
