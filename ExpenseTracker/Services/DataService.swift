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
    
    //create an user in the database
    func createUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    //retrieve an user information based on uid
    func retrieveUser(uid: String, completion: @escaping (_ status: Bool)->()) {
        
        REF_USERS.child(uid).getData { (error, snapshot) in
            if error == nil {
                let userInfo = snapshot.value as! Dictionary<String, Any>
                self.user = User(username: userInfo["username"] as! String, email: userInfo["email"] as! String, balance: userInfo["balance"] as! Int, income: userInfo["income"] as! Int, expense: userInfo["expense"] as! Int)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    //create and add a transaction into an user
    func createTransaction(uid: String, transactionData: [String: Any]){
        let uuid = UUID().uuidString
        REF_USERS.child(uid).child("transactions/\(uuid)").setValue(transactionData)
    }
    
    //retrieve all transactions
    func getAllTransactions(uid: String, completion: @escaping (_ status: Bool)->()){
        //REF_USERS.child(uid)
    }
    
}
