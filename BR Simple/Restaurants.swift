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
    let contact: RestaurantContact?
    let location: RestaurantLocation
    
    var bgImage: UIImage {
        if let url = URL(string: backgroundImageURL),
           let data = try? Data(contentsOf: url) {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage()
        }
    }
    
}

struct RestaurantLocation: Codable {
    let address: String
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let postalCode: String?
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}

struct RestaurantContact: Codable {
    let phone: String
    let formattedPhone: String
    let twitter: String?
    let facebook: String?
    let facebookUsername: String?
    let facebookName : String?
    
}


enum CodingKeys: String, CodingKey {
    case restaurantsName = "name"
    case restaurantsCategory = "category"
    case backgroundImageURL
    case RestaurantLocation
    case RestaurantContact
}
