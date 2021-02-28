//
//  EmptyTransactionView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-26.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct EmptyTransactionView: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        VStack(alignment: .center, spacing: gr.size.height*0.06) {
            Spacer()
            Image("piggyBank").resizable().aspectRatio(contentMode: .fit).frame(width: gr.size.width*0.4, height: gr.size.width*0.4)
            
            Text("Go add some transactions")
                .foregroundColor(.gray)
                .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .rounded))
            Spacer()
            Spacer()
        }.padding(.top, gr.size.height*0.5)
        .frame(width: gr.size.width, height: gr.size.height)
        .background(Color.clear)
    }
}

struct EmptyTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            EmptyTransactionView(gr: gr)
        }
        
    }
}
