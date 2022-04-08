//
//  Restaurants.swift
//  BR Simple
//
//  Created by Aleksandar Stojanovic on 4/1/22.
//

import Foundation
import UIKit

struct Restaurants: Codable {
    let restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contact?
    let location: Location
    
    var bgImage: UIImage {
        if let url = URL(string: backgroundImageURL),
           let data = try? Data(contentsOf: url) {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage()
        }
    }
}

// MARK: - Contact
struct Contact: Codable {
    let phone, formattedPhone: String
    let twitter, facebook, facebookUsername, facebookName: String?
}

// MARK: - Location
struct Location: Codable {
    let address: String
    let crossStreet: String?
    let lat, lng: Double
    let postalCode: String?
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}
