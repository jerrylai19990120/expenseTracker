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
                    Text("32,465")
                        .font(.system(size: gr.size.width*0.12, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                }
                Text("September 2020")
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
                        Text("$3000")
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
                        Text("$3000")
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
            MainStatusView(gr: gr)
        }
        
    }
}
