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

class DataService {
    
    static let instance = DataService()
    
    var user: User?
    
    private var _REF_USERS = DATABASE_REF.child("users")
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    //all transactions
    var transactions = [Transaction]()
    
    //recent transactions
    var recentTransactions = [Transaction]()
    
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

            guard let allTransactions = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(false)
                return
            }
            
            var count = 1
            
            for item in allTransactions {
                let transactionInfo = item.value as! [String:Any]
                
                let transaction = Transaction(category: transactionInfo["category"] as! String, note: transactionInfo["note"] as! String, date: transactionInfo["date"] as! String, amount: transactionInfo["amount"] as! Int, isIncome: transactionInfo["isIncome"] as! Bool)
                
                if count <= 5 {
                    self.recentTransactions.append(transaction)
                }
                self.transactions.append(transaction)
                count += 1
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
    
    
}
