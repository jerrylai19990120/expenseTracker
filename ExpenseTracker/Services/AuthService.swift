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
    
    
    func createUser(email: String, password: String, completion: @escaping (_ status: Bool)->Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (_ status: Bool)->()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
