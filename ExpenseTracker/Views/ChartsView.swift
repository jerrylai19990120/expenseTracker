//
//  ChartsView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SwiftUICharts
import Firebase

struct ChartsView: View {
    
    var gr: GeometryProxy
    
    //charts data
    @State var incomeData: [Double] = [Double]()
    @State var expenseData: [Double] = [Double]()
    @State var barChartIncome = [(String, Int)]()
    
    @State var isNightMode = false
    
    let nightStyle = ChartStyle(backgroundColor: .black, accentColor: Color(red: 95/255, green: 2/255, blue: 232/255), secondGradientColor: Color(red: 212/255, green: 172/255, blue: 247/255), textColor: Color(red: 248/255, green: 198/255, blue: 52/255), legendTextColor: .gray, dropShadowColor: .white)
    
    let dayStyle = ChartStyle(backgroundColor: .white, accentColor: .orange, secondGradientColor: .red, textColor: .black, legendTextColor: .gray, dropShadowColor: .gray)


    
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
                        .onTapGesture {
                            self.isNightMode.toggle()
                    }
                        

                }.padding().padding(.top, gr.size.height*0.1)
                
                
                VStack {
                    //Spacer()
                    
                    MultiLineChartView(data: [(self.incomeData, GradientColors.orngPink), (self.expenseData, GradientColors.purple)], title: "Income VS. Expense", style:  isNightMode ? nightStyle : dayStyle, form: ChartForm.large)
                    
                        
                    
                    
                    //Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: gr.size.width*0.06) {
                            BarChartView(data: ChartData(values: self.barChartIncome), title: "Income", legend: "Recent", style: isNightMode ? nightStyle : dayStyle)
                            
                            PieChartView(data: DataService.instance.pieChartProportion, title: "Category", legend: "Recent", style: isNightMode ? nightStyle : dayStyle)
                            
                            LineChartView(data: self.expenseData, title: "Expense", legend: "Recent", style:  isNightMode ? nightStyle : dayStyle, form: ChartForm.detail)
                        }.padding()
                        
                    }
                    Spacer()
                    
                }.padding(.top, gr.size.height*0.02)
                    .background(isNightMode ? Color(red: 22/255, green: 27/255, blue: 34/255) : Color(red: 245/255, green: 247/255, blue: 249/255))
                
                
            }.onAppear {
                DataService.instance.getAllTransactions(uid: Auth.auth().currentUser!.uid) { (success) in
                    if success {
                        self.incomeData = DataService.instance.incomeData
                        self.expenseData = DataService.instance.expenseData
                        self.barChartIncome = DataService.instance.barChartIncome
                        
                    }
                }
                
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
