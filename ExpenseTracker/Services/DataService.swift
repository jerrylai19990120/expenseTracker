//
//  DataService.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-26.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import Firebase

let DATABASE_REF = Database.database().reference()

let STORAGE_REF = Storage.storage().reference()

class DataService {
    
    static let instance = DataService()
    
    var user: User?
    
    private var _REF_USERS = DATABASE_REF.child("users")
    
    private var _REF_STORAGE_IMG = STORAGE_REF.child("AvatarImages")
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_STORAGE_REF: StorageReference {
        return _REF_STORAGE_IMG
    }
    
    //all transactions
    var transactions = [Transaction]()
    
    //recent transactions
    var recentTransactions = [Transaction]()
    
    //income and expense data
    var incomeData: [Double] = [Double]()
    var expenseData: [Double] = [Double]()
    
    //avatar image url
    var imageURL = ""
    
    //avatar image data
    var imageData: Data?
    
    //pie chart data
    var pieChartExpense: [String:Double] = [
        "Food & Drinks": 0.0,
        "Clothing": 0.0,
        "Entertainment": 0.0,
        "Medical": 0.0,
        "Other": 0.0,
        "Income": 0.0,
        "Transportation": 0.0
    ]
    
    var pieChartProportion: [Double] = [Double]()
    
    //bar chart data
    var barChartIncome = [(String, Int)]()
    
    //create an user in the database
    func createUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    //retrieve an user information based on uid
    func retrieveUser(uid: String, completion: @escaping (_ status: Bool)->()) {
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let userInfo = snapshot.value as? [String:Any] else {
                completion(false)
                return
            }
            self.user = User(username: userInfo["username"] as! String, email: userInfo["email"] as! String, balance: userInfo["balance"] as! Int, income: userInfo["income"] as! Int, expense: userInfo["expense"] as! Int)
            completion(true)
        }
        
    }
    
    //create and add a transaction into an user
    func createTransaction(uid: String, transactionData: [String: Any], isIncome: Bool, amount: Int){
        let uuid = UUID().uuidString
        REF_USERS.child(uid).child("transactions/\(uuid)").setValue(transactionData) { (error, dataRef) in
            if error == nil {
                self.updateAmount(uid: uid, isIncome: isIncome, amount: amount)
            }
        }
        
    }
    
    //retrieve all transactions
    func getAllTransactions(uid: String, completion: @escaping (_ status: Bool)->()){
        
        REF_USERS.child(uid).child("transactions").observeSingleEvent(of: .value) { (snapshot) in
            
            self.transactions = []
            self.recentTransactions = []
            self.incomeData = []
            self.expenseData = []
            self.pieChartExpense = [
                "Food & Drinks": 0.0,
                "Clothing": 0.0,
                "Entertainment": 0.0,
                "Medical": 0.0,
                "Other": 0.0,
                "Income": 0.0,
                "Transportation": 0.0
            ]
            self.pieChartProportion = []
            self.barChartIncome = []

            guard let allTransactions = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(false)
                return
            }
            
            var count = 1
            var dataCount = 1
            
            for item in allTransactions {
                let transactionInfo = item.value as! [String:Any]
                
                let transaction = Transaction(category: transactionInfo["category"] as! String, note: transactionInfo["note"] as! String, date: transactionInfo["date"] as! String, amount: transactionInfo["amount"] as! Int, isIncome: transactionInfo["isIncome"] as! Bool)
                
                if dataCount <= 100 {
                    let isIncome = transactionInfo["isIncome"] as! Bool
                    if isIncome {
                        self.incomeData.append(transactionInfo["amount"] as! Double)
                        self.barChartIncome.append(("in CAD", transactionInfo["amount"] as! Int))
                    } else {
                        self.pieChartExpense[transactionInfo["category"] as! String]! += transactionInfo["amount"] as! Double
                        self.expenseData.append(transactionInfo["amount"] as! Double)
                    }
                }
                
                if count <= 5 {
                    self.recentTransactions.append(transaction)
                }
                self.transactions.append(transaction)
                count += 1
            }
            
            var total = 0.0
            
            
            for (_, amount) in self.pieChartExpense {
                total += amount
            }
            
            for (_, amount) in self.pieChartExpense {
                self.pieChartProportion.append((amount/total)*100)
            }
            
            completion(true)
        }
    }
    
    
    //update balance and amount
    func updateAmount(uid: String, isIncome: Bool, amount: Int) {
        
        REF_USERS.child(uid).getData { (error, snapshot) in
            if error == nil {
                let userInfo = snapshot.value as! [String:Any]
                
                var balance = userInfo["balance"] as! Int
                var income = userInfo["income"] as! Int
                var expense = userInfo["expense"] as! Int
                
                if isIncome {
                    balance += amount
                    income += amount
                } else {
                    balance -= amount
                    expense += amount
                }
                
                let updatedData = [
                    "balance": balance,
                    "income": income,
                    "expense": expense
                ]
                
                self.REF_USERS.child(uid).updateChildValues(updatedData)
            }
        }
        
    }
    
    
    //upload avatar picture to firebase bucket
    func uploadAvatarPicture(uid: String, imgData: Data, completion: @escaping (_ status: Bool)->()){
        
        let imgRef = REF_STORAGE_REF.child(uid)
        
        let uploadTask = imgRef.putData(imgData, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                completion(false)
                return
            }
            
            imgRef.downloadURL { (url, erro) in
                guard let url = url else {
                    completion(false)
                    return
                }
                
                self.REF_USERS.child(uid).child("imageURL").setValue(url.absoluteString)
                self.imageURL = url.absoluteString
                completion(true)
            }
        }
       

    }
    
    //load image data
    func loadAvatarImage(uid: String, completion: @escaping (_ status: Bool)->()){
        
        REF_USERS.child(uid).child("imageURL").getData { (error, snapshot) in
            if error == nil {
                let urlString = String(describing: snapshot.value)
                guard let url = URL(string: urlString) else {
                    completion(false)
                    return
                }
                
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data else {return}
                    DispatchQueue.main.async {
                        self.imageData = data
                        self.imageURL = snapshot.value as! String
                        completion(true)
                    }
                }
                
                task.resume()
                
            } else {
                completion(false)
            }
        }
        
    }
    
    
}
