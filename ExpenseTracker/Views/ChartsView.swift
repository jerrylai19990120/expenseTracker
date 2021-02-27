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
                            BarChartView(data: ChartData(values: self.barChartIncome), title: "Income", legend: "Recent")
                            
                            PieChartView(data: DataService.instance.pieChartProportion, title: "Category", legend: "Recent")
                            
                            LineChartView(data: self.expenseData, title: "Expense", legend: "Recent", form: ChartForm.detail)
                        }.padding()
                        
                    }
                    Spacer()
                    
                }.padding(.top, gr.size.height*0.02)
                    .background(Color(red: 245/255, green: 247/255, blue: 249/255))
                
                
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
