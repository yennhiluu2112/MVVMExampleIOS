//
//  APIError.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 20/12/2023.
//

import Foundation

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        }
    }
}
