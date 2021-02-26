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
    
    func createUser(email: String, password: String, completion: @escaping (_ status: Bool)->Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            print("result: \(result)")
            print("error: \(error)")
            if error == nil {
                completion(true)
            } else {
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
