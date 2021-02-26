//
//  AuthService.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-25.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    var errorCode: Int = 0 // 1 for email issue
                           // 2 for password issue
                           // 3 for user not found
    var signUpErrCode: Int = 0 // 1 for email issue
                               // 2 for password issue
                               // 3 for email already in used
    
    func createUser(email: String, password: String, username: String, completion: @escaping (_ status: Bool)->Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if error == nil {
                let providerID = result?.user.providerID
                let uid = result?.user.uid
                let email = result?.user.email!
                
                let userData = ["providerID": providerID, "email": email, "balance": 0, "income": 0, "expense": 0, "username": username] as [String : Any]
                
                DataService.instance.createUser(uid: uid!, userData: userData)
                
                completion(true)
            } else {
                let description = error!.localizedDescription
                if description.contains("badly formatted") {
                    self.signUpErrCode = 1
                }
                
                if description.contains("password must be 6") {
                    self.signUpErrCode = 2
                }
                
                if description.contains("already in use") {
                    self.signUpErrCode = 3
                }
                
                completion(false)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (_ status: Bool)->()){
        
        errorCode = 0
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error == nil {
                completion(true)
            } else {
                let description = error!.localizedDescription
                if description.contains("badly formatted") {
                    self.errorCode = 1
                }
                
                if description.contains("password is invalid") {
                    self.errorCode = 2
                }
                
                if description.contains("no user record") {
                    self.errorCode = 3
                }
                
                completion(false)
            }
        }
    }
    
}
