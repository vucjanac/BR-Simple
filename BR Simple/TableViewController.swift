//
//  ViewController.swift
//  BR Simple
//
//  Created by Aleksandar Stojanovic on 4/1/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var restaurants = [Restaurant]()
    
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
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.categoryLabel.text = restaurant.category
        cell.restaurantImage.image = restaurant.bgImage

        let gradient = CAGradientLayer()
        gradient.frame = cell.gradientView.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradient.opacity = 0.2
        cell.gradientView.layer.insertSublayer(gradient, at: 0)
                
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? TableViewCell,
        let detailsVC = segue.destination as? DetailsViewController,
        let index = tableView.indexPath(for: sender) else {
            return
        }
        detailsVC.restaurant = restaurants[index.row]
    }
}

