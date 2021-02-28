//
//  AddActivityView.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import Firebase

struct AddActivityView: View {
    
    var gr: GeometryProxy
    
    @State var amount = ""
    
    @State var note = ""
    
    @Binding var popup: Bool
    
    @State var transactionDate = Date()
    
    var formatter = DateFormatter()
    
    @State var expanded = false
    
    @State var selection = "Food & Drinks"
    
    @State var selectionImage = "grocery"
    
    @State var selectionColor = "groceryColor"
    
    @State var isIncome = true
    
    @State var err = false
    
    @Binding var isNightMode: Bool
    
    init(gr: GeometryProxy, popup: Binding<Bool>, isNightMode: Binding<Bool>) {
        self.gr = gr
        self._popup = popup
        self.formatter.dateFormat = "MMM d, y"
        self._isNightMode = isNightMode
    }
    
    var body: some View {
        
            VStack {
                HStack {
                    Image(systemName: "xmark").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                        .foregroundColor(isNightMode ? Color.orange : Color.black)
                        .onTapGesture {
                            self.popup.toggle()
                            self.hideKeyBoard()
                    }
                    Spacer()
                    Text("Add Transaction")
                        .foregroundColor(isNightMode ? Color.orange : Color.black)
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .rounded))
                    Spacer()
                    Image(systemName: "checkmark").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                        .foregroundColor(isNightMode ? Color.orange : Color.black)
                        .onTapGesture {
                            self.uploadTransactionData()
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
                                .padding()
                                .keyboardType(.numberPad)
                                .font(.system(size: gr.size.width*0.08, weight: .medium, design: .rounded))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(err ? Color.red : Color.white, lineWidth: 1))
                                .foregroundColor(isNightMode ? Color.orange : Color.black)
                        }.padding()
                        
                        Toggle(isOn: $isIncome) {
                            
                            HStack {
                                if isIncome {
                                    Image(systemName: "dollarsign.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: gr.size.width*0.06)
                                        .foregroundColor(.yellow)
                                    
                                    Text("Income").font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                                    .foregroundColor(isNightMode ? Color.orange : Color.black)
                                } else {
                                    Image(systemName: "cart.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: gr.size.width*0.06)
                                        .foregroundColor(.green)
                                        
                                    Text("Expense").font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                                    .foregroundColor(isNightMode ? Color.orange : Color.black)
                                }
                                
                            }
                            
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
                                        .foregroundColor(isNightMode ? Color.orange : Color.black)
                                        .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .rounded))
                                    Spacer()
                                    if expanded {
                                        Image(systemName: "chevron.down").resizable()
                                            .foregroundColor(isNightMode ? Color.orange : Color.black)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: gr.size.width*0.054)
                                    } else {
                                        Image(systemName: "chevron.right").resizable()
                                            .foregroundColor(isNightMode ? Color.orange : Color.black)
                                            .aspectRatio(contentMode: .fit)
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
                                                .foregroundColor(isNightMode ? Color.orange : Color.black)
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
                                                .foregroundColor(isNightMode ? Color.orange : Color.black)
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
                                                .foregroundColor(isNightMode ? Color.orange : Color.black)
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
                                                .foregroundColor(isNightMode ? Color.orange : Color.black)
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
                                                .foregroundColor(isNightMode ? Color.orange : Color.black)
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
                                                .foregroundColor(isNightMode ? Color.orange : Color.black)
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
                                                .foregroundColor(isNightMode ? Color.orange : Color.black)
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
                                Text("\(self.formatter.string(from: self.transactionDate))").foregroundColor(isNightMode ? Color.orange : Color.black).font(.system(size: gr.size.width*0.046, weight: .semibold, design: .default))
                            }
                            
                            HStack {
                                Spacer()
                                DatePicker("Transaction Date:", selection: $transactionDate, displayedComponents: .date).labelsHidden()
                                    .colorInvert()
                                    .colorMultiply(isNightMode ? Color.orange : Color.black)
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
                                    .font(.system(size: gr.size.width*0.07, weight: .medium, design: .rounded))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                                    .foregroundColor(isNightMode ? Color.orange : Color.black)
                        }.padding()
                        Spacer()
                        
                    }.padding(.bottom, gr.size.height*0.1)
                }
                
                
                
                
            }.padding(.top, gr.size.height*0.03)
            .frame(height: gr.size.height*0.88)
                .background(isNightMode ? Color(red: 64/255, green: 64/255, blue: 64/255) : Color.white)
            .cornerRadius(30)
                .shadow(color: isNightMode ? Color.orange : Color.gray, radius: 6, y: -6)
                .onTapGesture {
                    self.hideKeyBoard()
        }
        //vstack
    }
    
    //create proper format of the data
    func createTransactionData() -> [String:Any] {
        
        if self.amount == "" {
            let transactionData = [
            "category": self.selection,
            "note": self.note,
            "date": self.formatter.string(from: transactionDate),
            "amount": 0,
            "isIncome": self.isIncome
            ] as [String:Any]
            return transactionData
        } else {
            let transactionData = [
                "category": self.selection,
                "note": self.note,
                "date": self.formatter.string(from: transactionDate),
                "amount": Int(self.amount)!,
                "isIncome": self.isIncome
                ] as [String:Any]
            return transactionData
        }
        
    }
    
    //send out the data to firebase database
    func uploadTransactionData() {
        let data = createTransactionData()
        if self.amount == "" {
            self.err = true
        } else {
            DataService.instance.createTransaction(uid: Auth.auth().currentUser!.uid, transactionData: data, isIncome: isIncome, amount: Int(amount)!)
            hideKeyBoard()
            self.popup.toggle()
        }
    }
    
    func hideKeyBoard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            AddActivityView(gr: gr, popup: Binding.constant(true), isNightMode: .constant(true))
        }
    }
}
