//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ExpenseItem: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        HStack {
            
            HStack(spacing: gr.size.width*0.03) {
                
                Image("transportation")
                    .resizable()
                    .clipped()
                    .padding(.all, 8)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.12, height: gr.size.width*0.12)
                    .background(Color(red: 252/255, green: 244/255, blue: 224/255))
                    .cornerRadius(gr.size.width*0.12)
                
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Fly to Paris")
                        .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                        .foregroundColor(Color.black)
                    
                    
                    
                    Text("May 12 at 9:30PM")
                        .font(.system(size: gr.size.width*0.03, weight: .medium, design: .default))
                        .foregroundColor(Color.gray)
                }
                
            }
            Spacer()
            Text("-$524")
                .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                .foregroundColor(Color(red: 216/255, green: 108/255, blue: 133/255))
            
        }.padding(.all)
            .background(Color.white)
            .cornerRadius(16).shadow(color: .gray, radius: 3)
        
    }
}

struct ExpenseItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ExpenseItem(gr: gr)
        }
        
    }
}
