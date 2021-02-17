//
//  MainStatusView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct MainStatusView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            
            VStack(alignment: .center, spacing: 20) {
                Text("CURRENT BALANCE")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                HStack{
                    Text("$")
                        .font(.system(size: 36, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                    Text("32,465")
                        .font(.system(size: 54, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                }
                Text("September 2020")
                    .font(.system(size: 18, weight: .light, design: .default))
                    .foregroundColor(Color.white)
            }
            
            HStack(spacing: 154) {
                
                HStack(alignment: .firstTextBaseline, spacing: 12) {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("INCOME")
                            .font(.system(size: 18, weight: .light, design: .default))
                            .foregroundColor(Color.white)
                        Text("$3000")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(Color.white)
                    }
                }
                
                HStack(alignment: .firstTextBaseline,spacing: 12) {
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("EXPENSE")
                            .font(.system(size: 18, weight: .light, design: .default))
                            .foregroundColor(Color.white)
                        Text("$3000")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(Color.white)
                    }
                }
                
            }
        }.padding([.top, .bottom], 70)
    }
}

struct MainStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MainStatusView()
    }
}
