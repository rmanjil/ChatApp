//
//  AuthManager.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import Foundation
import Firebase


class AuthManager {
    
    func login(email: String, password: String, completion: @escaping ((Result<Bool, Error>) -> Void)) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) {  result, error in
            if let result = result {
                completion(.success(true))
                return
            }
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.failure(AppError.custom("Something went wrong!!!")))
        }
    }
}
