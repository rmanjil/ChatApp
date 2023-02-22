//
//  AuthManager.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import Foundation
import Firebase


class AuthManager {
    
    func login(email: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            
        }
    }
}
