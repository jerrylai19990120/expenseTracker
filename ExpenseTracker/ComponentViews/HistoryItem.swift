//
//  HistoryItem.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-18.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HistoryItem: View {
    
    var gr: GeometryProxy
    
    var date = "not available"
    
    var note = ""
    
    var amount = 0
    
    var isIncome = true
    
    var category = "Clothing"
    
    var imgDict = [
        "Food & Drinks": "grocery",
        "Clothing": "clothing",
        "Entertainment": "entertainment",
        "Medical": "medical",
        "Other": "other",
        "Income": "income",
        "Transportation": "transportation"
    ]
    
    var colorDict = [
        "Food & Drinks": "groceryColor",
        "Clothing": "clothingColor",
        "Entertainment": "entertainmentColor",
        "Medical": "medicalColor",
        "Other": "otherColor",
        "Income": "incomeColor",
        "Transportation": "transportationColor"
    ]
    
    var body: some View {
            
            HStack {
                
                HStack(spacing: gr.size.height*0.02) {
                    
                    Image("\(imgDict[category]!)")
                        .resizable()
                        .clipped()
                        .padding(.all, 8)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.12, height: gr.size.width*0.12)
                        .background(Color("\(colorDict[category]!)"))
                        .cornerRadius(gr.size.width*0.12)
                    
                    
                    
                    VStack(alignment: .leading, spacing: gr.size.height*0.01) {
                        Text("\(note=="" ? category : note)")
                            .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                            .foregroundColor(Color.black)
                        
                        
                        Text("\(date)")
                            .font(.system(size: gr.size.width*0.03, weight: .medium, design: .default))
                            .foregroundColor(Color.gray)
                    }
                    
                }
                Spacer()
                Text("\(isIncome ? "+$\(amount)" : "-$\(amount)")")
                    .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                    .foregroundColor(isIncome ? Color(red: 45/255, green: 115/255, blue: 44/255) : Color(red: 216/255, green: 108/255, blue: 133/255))
                
            }.padding(.all)
            .background(Color.white)
        
        
            
    }
}

struct HistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HistoryItem(gr: gr)
        }
    }
}
