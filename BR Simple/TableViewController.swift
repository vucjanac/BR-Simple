//
//  ViewController.swift
//  BR Simple
//
//  Created by Aleksandar Stojanovic on 4/1/22.
//

import UIKit

class TableViewController: UITableViewController {

    var restaurants = [RestaurantsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://s3.amazonaws.com/br-codingexams/restaurants.json"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
        func parse(json: Data) {
            let decoder = JSONDecoder()
            
            do {
                let jsonRestaurants: Restaurants = try decoder.decode(Restaurants.self, from: json)
                restaurants = jsonRestaurants.restaurants
                tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        tableView.estimatedRowHeight = 160

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
        
//        return 15
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.restaurantsName
        cell.categoryLabel.text = restaurant.restaurantsCategory
        cell.restaurantImage.image = restaurant.bgImage
        
        
               
        return cell
    }
    
}

