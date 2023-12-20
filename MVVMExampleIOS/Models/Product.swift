//
//  Product.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 20/12/2023.
//

import Foundation
import UIKit

final class Product {
    var id: Int
    var title: String
    var images: [String]
    var category: String
    
    init(json: JSON) {
        self.id = json["id"] as! Int
        self.title = json["title"] as! String
        self.images = json["images"] as! [String]
        self.category = json["category"] as! String
    }
}
