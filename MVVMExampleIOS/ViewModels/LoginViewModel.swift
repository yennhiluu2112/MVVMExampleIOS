//
//  LoginViewModel.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 18/12/2023.
//

import Foundation

// MARK: - enum
enum LoginResult {
    case success
    case failure(Bool, String)
}

final class LoginViewModel {
    
    // MARK: - typealias
    typealias Completion = (LoginResult) -> Void
    
    // MARK: - Properties
    var email: String = ""
    var password: String = ""
    
    // MARK: - Actions
    func login(email: String, password: String, completion: Completion) {
        if email == "" || password == "" {
            completion(.failure(true, "email or password is empty"))
        } else {
            //update data
            self.password = ""
            self.email = ""
            
            //save data
            DataManager.shared().save(email: email, password: password)
            
            //callback
            completion(.success)
        }
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}
