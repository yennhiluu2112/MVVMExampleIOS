//
//  HomeViewModel.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 20/12/2023.
//

import Foundation

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {
    
    var products: [Product] = []
    var names: [String] = []
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let results = feed["results"] as! [JSON]
                        for item in results {
                            let name = item["name"] as! String
                            self.names.append(name)
                        }
                        //call back
                        completion(true, "")
                    } else {
                        //call back
                        completion(false, "Data format is error.")
                    }
                }
            }
        }
        task.resume()
    }
    
    func loadAPI2(completion: @escaping Completion) {
            let urlString = "https://dummyjson.com/products"
            
            Networking.shared().request(with: urlString) { (data, error) in
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let products = json["products"] as! [JSON]

                        for item in products {
                            let product = Product(json: item)
                            self.products.append(product)
                            completion(true, "")
                       }
                    } else {
                        completion(false, "Data format is error.")
                    }
                }
            }
        }
}
