//
//  DataManager.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 18/12/2023.
//

import Foundation

class DataManager {
    
    //singleton
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager()
        return dataManager
    }()
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
    
    // init
    private init() {}
    
    //open database
    func read() -> (String, String) {
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return (email, password)
    }
    
    //save database
    func save(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
}
