//
//  AddActivityView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    
    var gr: GeometryProxy
    
    @State var amount = ""
    
    @State var note = ""
    
    var body: some View {
        
            VStack {
                HStack {
                    Image(systemName: "xmark").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                    Spacer()
                    Text("Add Transaction")
                        .foregroundColor(.black)
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .rounded))
                    Spacer()
                }
                
                HStack {
                    Text("AMT").font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 33/255, green: 206/255, blue: 153/255))
                    .cornerRadius(gr.size.width*0.08)
                    Spacer()
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.numberPad)
                        .font(.system(size: gr.size.width*0.1, weight: .medium, design: .rounded))
                }
                
                HStack {
                    Image("grocery").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                        .padding()
                        .background(Color("groceryColor"))
                        .cornerRadius(gr.size.width*0.09)
                    Spacer()
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.numberPad)
                        .font(.system(size: gr.size.width*0.08, weight: .medium, design: .rounded))
                }
                
                HStack {
                    Image(systemName: "calendar").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("bgPurple"))
                        .cornerRadius(gr.size.width*0.09)
                    Spacer()
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.numberPad)
                        .font(.system(size: gr.size.width*0.08, weight: .medium, design: .rounded))
                }
                
                HStack {
                    Image(systemName: "text.alignleft").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.07, height: gr.size.width*0.07)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("bgPurple"))
                        .cornerRadius(gr.size.width*0.09)
                        
                    Spacer()
                    TextField("Notes", text: $note)
                        .keyboardType(.numberPad)
                        .font(.system(size: gr.size.width*0.08, weight: .medium, design: .rounded))
                }
                
                Spacer()
                
            }.padding().padding(.top, gr.size.height*0.03)
            .frame(height: gr.size.height*0.88)
            .background(Color.white)
            .cornerRadius(30)
                .shadow(color: .gray, radius: 6, y: -6)
        //vstack
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            AddActivityView(gr: gr)
        }
    }
}
