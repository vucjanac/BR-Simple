//
//  DetailsViewController.swift
//  BR Simple
//
//  Created by Aleksandar Stojanovic on 4/5/22.
//

import UIKit
import MapKit

final class DetailsViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var image: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var social: UILabel!
    @IBOutlet var mapKitView: MKMapView!
    
    var restaurant: RestaurantsModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateMap()
        
        view.backgroundColor = .lightGray
    }
    
    func updateUI() {
        
        self.name.text = restaurant?.restaurantsName
        self.category.text = restaurant?.restaurantsCategory
        self.address.text = restaurant?.location.address
        self.phone.text = restaurant?.contact?.formattedPhone
        self.social.text = restaurant?.contact?.twitter
    }
    
    func updateMap() {
        
        let lattitude: CLLocationDegrees = (restaurant?.location.lat)!
        let longitude: CLLocationDegrees = (restaurant?.location.lng)!
        
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let center: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lattitude, longitude: longitude)
        
        let location: MKCoordinateRegion = MKCoordinateRegion(center: center, span: span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = restaurant?.restaurantsName
        
        mapKitView.addAnnotation(annotation)
        mapKitView.setRegion(location, animated: true)
    }
        
}
