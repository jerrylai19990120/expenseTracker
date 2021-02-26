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
    
    @Binding var popup: Bool
    
    @State var transactionDate = Date()
    
    var formatter = DateFormatter()
    
    @State var dateString = ""
    
    @State var expanded = false
    
    @State var selection = "Food & Drinks"
    
    @State var selectionImage = "grocery"
    
    @State var selectionColor = "groceryColor"
    
    var body: some View {
        
            VStack {
                HStack {
                    Image(systemName: "xmark").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                        .onTapGesture {
                            self.popup.toggle()
                    }
                    Spacer()
                    Text("Add Transaction")
                        .foregroundColor(.black)
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .rounded))
                    Spacer()
                    Image(systemName: "checkmark").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                        .onTapGesture {
                            self.popup.toggle()
                    }
                }.padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                        HStack {
                            Text("AMT").font(.system(size: gr.size.width*0.05, weight: .medium, design: .rounded))
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(red: 33/255, green: 206/255, blue: 153/255))
                                .cornerRadius(gr.size.width*0.06)
                            Spacer()
                            TextField("Enter amount", text: $amount)
                                .keyboardType(.numberPad)
                                .font(.system(size: gr.size.width*0.08, weight: .medium, design: .rounded))
                        }.padding()
                        
                        HStack(spacing: gr.size.width*0.06) {
                            Image("\(self.selectionImage)").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                                .padding()
                                .background(Color("\(self.selectionColor)"))
                                .cornerRadius(gr.size.width*0.09)
                            
                            VStack {
                                HStack {
                                    Text("\(self.selection)")
                                        .foregroundColor(.black)
                                        .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .rounded))
                                    Spacer()
                                    if expanded {
                                        Image(systemName: "chevron.down").resizable().renderingMode(.original).aspectRatio(contentMode: .fit)
                                            .frame(width: gr.size.width*0.054)
                                    } else {
                                        Image(systemName: "chevron.right").resizable().renderingMode(.original).aspectRatio(contentMode: .fit)
                                            .frame(width: gr.size.width*0.028)
                                    }
                                    
                                }.onTapGesture {
                                    self.expanded.toggle()
                                }
                                
                                if expanded {
                                    
                                    Button(action: {
                                        self.expanded.toggle()
                                        self.selection = "Clothing"
                                        self.selectionImage = "clothing"
                                        self.selectionColor = "clothingColor"
                                    }) {
                                        HStack {
                                            Image("clothing").resizable().renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                                                .padding(.all, gr.size.width*0.03)
                                                .background(Color("clothingColor"))
                                                .cornerRadius(gr.size.width*0.09)
                                            Spacer()
                                            Text("Clothing")
                                                .foregroundColor(.black)
                                                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                                            Spacer()
                                        }
                                    }
                                    
                                    Button(action: {
                                        self.expanded.toggle()
                                        self.selection = "Transportation"
                                        self.selectionImage = "transportation"
                                        self.selectionColor = "transportationColor"
                                    }) {
                                        HStack {
                                            Image("transportation").resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                                                .padding(.all, gr.size.width*0.03)
                                                .background(Color("transportationColor"))
                                                .cornerRadius(gr.size.width*0.09)
                                            Spacer()
                                            Text("Transportation")
                                                .foregroundColor(.black)
                                                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                                            Spacer()
                                        }
                                    }
                                    
                                    Button(action: {
                                        self.expanded.toggle()
                                        self.selection = "Entertainment"
                                        self.selectionImage = "entertainment"
                                        self.selectionColor = "entertainmentColor"
                                    }) {
                                        HStack {
                                            Image("entertainment").resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                                                .padding(.all, gr.size.width*0.03)
                                                .background(Color("entertainmentColor"))
                                                .cornerRadius(gr.size.width*0.09)
                                            Spacer()
                                            Text("Entertainment")
                                                .foregroundColor(.black)
                                                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                                            Spacer()
                                        }
                                    }
                                    
                                    Button(action: {
                                        self.expanded.toggle()
                                        self.selection = "Food & Drinks"
                                        self.selectionImage = "grocery"
                                        self.selectionColor = "groceryColor"
                                    }) {
                                        HStack {
                                            Image("grocery").resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                                                .padding(.all, gr.size.width*0.03)
                                                .background(Color("groceryColor"))
                                                .cornerRadius(gr.size.width*0.09)
                                            Spacer()
                                            Text("Food & Drinks")
                                                .foregroundColor(.black)
                                                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                                            Spacer()
                                        }
                                    }
                                    
                                    Button(action: {
                                        self.expanded.toggle()
                                        self.selection = "Income"
                                        self.selectionImage = "income"
                                        self.selectionColor = "incomeColor"
                                    }) {
                                        HStack {
                                            Image("income").resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                                                .padding(.all, gr.size.width*0.03)
                                                .background(Color("incomeColor"))
                                                .cornerRadius(gr.size.width*0.09)
                                            Spacer()
                                            Text("Income")
                                                .foregroundColor(.black)
                                                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                                            Spacer()
                                        }
                                    }
                                    
                                    Button(action: {
                                        self.expanded.toggle()
                                        self.selection = "Medical"
                                        self.selectionImage = "medical"
                                        self.selectionColor = "medicalColor"
                                    }) {
                                        HStack {
                                            Image("medical").resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                                                .padding(.all, gr.size.width*0.03)
                                                .background(Color("medicalColor"))
                                                .cornerRadius(gr.size.width*0.09)
                                            Spacer()
                                            Text("Medical")
                                                .foregroundColor(.black)
                                                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                                            Spacer()
                                        }
                                    }
                                    
                                    Button(action: {
                                        self.expanded.toggle()
                                        self.selection = "Other"
                                        self.selectionImage = "other"
                                        self.selectionColor = "otherColor"
                                    }) {
                                        HStack {
                                            
                                            Image("other").resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                                                .padding(.all, gr.size.width*0.03)
                                                .background(Color("otherColor"))
                                                .cornerRadius(gr.size.width*0.09)
                                            Spacer()
                                            Text("Other")
                                                .foregroundColor(.black)
                                                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                    
                                }
                            }.animation(.spring())
                            
                        }.padding()
                        
                        
                        VStack(alignment: .leading) {
                                
                            HStack {
                                Image(systemName: "calendar").resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color("bgPurple"))
                                        .cornerRadius(gr.size.width*0.09)
                                Spacer()
                                Text("\(self.formatter.string(from: self.transactionDate))").bold()
                            }
                            
                            HStack {
                                Spacer()
                                DatePicker("Transaction Date:", selection: $transactionDate, displayedComponents: .date).labelsHidden()
                                    .frame(height: gr.size.height*0.12, alignment: .center)
                                    .clipped()
                                Spacer()
                            }
                            
                                
                                
                        }.padding()
                            
                        HStack {
                            Image(systemName: "text.alignleft").resizable().aspectRatio(contentMode: .fit)
                                    .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color("bgPurple"))
                                    .cornerRadius(gr.size.width*0.09)
                                
                            Spacer()
                            TextField("Notes", text: $note)
                                    .keyboardType(.numberPad)
                                    .font(.system(size: gr.size.width*0.07, weight: .medium, design: .rounded))
                        }.padding()
                        Spacer()
                        
                    }
                }
                
                
                
                
            }.padding(.top, gr.size.height*0.03)
            .frame(height: gr.size.height*0.88)
            .background(Color.white)
            .cornerRadius(30)
                .shadow(color: .gray, radius: 6, y: -6)
                .onAppear {
                    self.formatter.dateFormat = "MMM d, y"
                    self.dateString = self.formatter.string(from: self.transactionDate)
        }
        //vstack
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            AddActivityView(gr: gr, popup: Binding.constant(true))
        }
    }
}
