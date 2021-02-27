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
    
    var gr: GeometryProxy
    
    @State var incomeData: [Double] = [Double]()
    @State var expenseData: [Double] = [Double]()
    
    var body: some View {
        ZStack {
            Color("bgPurple")
            
            VStack {
                
                HStack {
                    Text("Expense Analysis")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
                    Spacer()
                    Image(systemName: "moon.circle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .clipped()
                        .frame(width: gr.size.width*0.08, height: gr.size.width*0.08)
                        .aspectRatio(contentMode: .fit)
                        

                }.padding().padding(.top, gr.size.height*0.1)
                
                
                VStack {
                    //Spacer()
                    
                    MultiLineChartView(data: [(self.incomeData, GradientColors.orngPink), (self.expenseData, GradientColors.purple)], title: "Income VS. Expense", form: ChartForm.large)
                        
                    
                    
                    //Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: gr.size.width*0.06) {
                            BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)]), title: "Income", legend: "Monthly")
                            
                            PieChartView(data: [8,23,54,32], title: "Category", legend: "Cumulative")
                            
                            LineChartView(data: self.expenseData, title: "Expense", legend: "Monthly", form: ChartForm.detail)
                        }.padding()
                        
                    }
                    Spacer()
                    
                }.padding(.top, gr.size.height*0.02)
                    .background(Color(red: 245/255, green: 247/255, blue: 249/255))
                
                
            }.onAppear {
                self.incomeData = DataService.instance.incomeData
                self.expenseData = DataService.instance.expenseData
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ChartsView(gr: gr)
        }
    }
}
