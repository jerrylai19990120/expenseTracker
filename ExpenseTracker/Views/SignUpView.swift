//
//  SignUpView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color(red: 245/255, green: 247/255, blue: 249/255))
            SignUpPanel()
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
