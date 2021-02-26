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
    
    private var _REF_USERS = DATABASE_REF.child("users")
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    func createUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
