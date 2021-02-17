//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ExpenseItem: View {
    var body: some View {
        HStack(spacing: 120) {
            
            HStack(spacing: 10) {
                
                Image("transportation")
                    .resizable()
                    .clipped()
                    .padding(.all, 8)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 46, height: 46)
                    .background(Color(red: 252/255, green: 244/255, blue: 224/255))
                    .cornerRadius(23)
                
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Fly to Paris")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(Color.black)
                    
                    
                    Text("May 12 at 9:30PM")
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundColor(Color.gray)
                }
                
            }
            
            Text("-$524")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(Color(red: 216/255, green: 108/255, blue: 133/255))
            
        }.padding(.all, 20)
            .background(Color.white)
            .cornerRadius(16)
    }
}

struct ExpenseItem_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItem()
    }
}
