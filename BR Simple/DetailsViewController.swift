//
//  DetailsViewController.swift
//  BR Simple
//
//  Created by Aleksandar Stojanovic on 4/5/22.
//

import UIKit
import MapKit

final class DetailsViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var socialLabel: UILabel!
    @IBOutlet var mapKitView: MKMapView!
    
    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateMap()
        
        view.backgroundColor = .lightGray
    }
    
    func updateUI() {
        
        self.imageView.image = restaurant?.bgImage
        self.nameLabel.text = restaurant?.name
        self.categoryLabel.text = restaurant?.category
        self.addressLabel.text = restaurant?.location.address
        self.phoneLabel.text = restaurant?.contact?.formattedPhone
        self.socialLabel.text = restaurant?.contact?.twitter
    }
    
    func updateMap() {
        guard let restaurant = restaurant
        else {return}
        
        let longitude: CLLocationDegrees = restaurant.location.lng
        let lattitude: CLLocationDegrees = restaurant.location.lat
        
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let center: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lattitude, longitude: longitude)
        
        let location: MKCoordinateRegion = MKCoordinateRegion(center: center, span: span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = restaurant.name
        
        mapKitView.addAnnotation(annotation)
        mapKitView.setRegion(location, animated: true)
    }
    
}
