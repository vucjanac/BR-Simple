//
//  Restaurants.swift
//  BR Simple
//
//  Created by Aleksandar Stojanovic on 4/1/22.
//

import Foundation
import UIKit

struct Restaurants: Codable {
    let restaurants:[RestaurantsModel]
}

struct RestaurantsModel: Codable {
    let restaurantsName: String
    let restaurantsCategory: String
    let backgroundImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case restaurantsName = "name"
        case restaurantsCategory = "category"
        case backgroundImageURL
    }
    var bgImage: UIImage {
        if let url = URL(string: backgroundImageURL),
           let data = try? Data(contentsOf: url) {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage()
        }
    }
    
}
