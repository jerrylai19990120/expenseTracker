//
//  ProfileView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    
    var gr: GeometryProxy
    
    @State var username = "User"
    @State var balance = -1
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle().fill(Color("bgPurple"))
                    .frame(height: gr.size.height*0.5)
                Rectangle().fill(Color.white)
            }
            
            VStack {
                Spacer()
                HStack(alignment: .center) {
                    
                    Text("User Profile").foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.06, weight: .bold, design: .default))
                    Spacer()
                    NavigationLink(destination: WelcomeView().navigationBarTitle("").navigationBarHidden(true)){
                        Image(systemName: "arrow.right.square")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: gr.size.height*0.044, height: gr.size.height*0.044)
                            .foregroundColor(.white)
                    }
                    
                    
                }.padding().padding(.top, gr.size.height*0.05)
                
                
                Image(systemName: "person.fill")
                    .resizable().aspectRatio(contentMode: .fit)
                .clipped()
                    .frame(width: gr.size.height*0.1, height: gr.size.height*0.1)
                .padding()
                    .background(Color.white)
                    .cornerRadius(60)

                
                HStack {
                    Text("Hello,")
                    .foregroundColor(.white)
                    .font(.system(size: gr.size.height*0.03, weight: .thin, design: .default))
                    
                    Text("\(username)")
                    .foregroundColor(.white)
                    .font(.system(size: gr.size.height*0.035, weight: .medium, design: .default))
                }.padding()
                
                Spacer()
                
                VStack {
                    Text("$ \(balance)")
                        .font(.system(size: gr.size.height*0.054, weight: .medium, design: .rounded))
                    Text("CURRENT BALANCE")
                    .font(.system(size: gr.size.height*0.028, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                }.padding()
                    .frame(width: gr.size.width*0.9)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 6)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                        ExpenseItem(gr: gr)
                    }.padding()
                }
                
            }.onAppear {
                DataService.instance.retrieveUser(uid: Auth.auth().currentUser!.uid) { (success) in
                    if success {
                        self.balance = DataService.instance.user!.balance
                        self.username = DataService.instance.user!.username
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ProfileView(gr: gr)
        }
        
    }
}
