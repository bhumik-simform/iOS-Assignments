//
//  MapTabViewController.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 31/03/26.
//

import UIKit
import MapKit

class MapTabViewController: UIViewController {
    
    let cities: [String] = [
        "Ahmedabad", "Amsterdam", "Auckland", "Bangalore", "Bangkok",
        "Barcelona", "Beijing", "Berlin", "Buenos Aires", "Cairo",
        "Cape Town", "Casablanca", "Delhi", "Dubai", "Hong Kong",
        "Istanbul", "Jaipur", "Kyoto", "Lagos", "Lisbon",
        "London", "Los Angeles", "Madrid", "Melbourne", "Mexico City",
        "Mumbai", "Nairobi", "New York City", "Paris",
        "Prague", "Riyadh", "Rio de Janeiro", "Rome", "San Francisco",
        "São Paulo", "Seoul", "Singapore", "Sydney", "Tokyo",
        "Toronto", "Venice", "Vienna"
    ].sorted()

    
    @IBOutlet weak var mapView: MKMapView!
   
    @IBOutlet weak var regionPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regionPicker.delegate = self
        regionPicker.dataSource = self
    }
    
    @IBAction func selectedCity(_ sender: UIBarButtonItem) {
        let currCity = cities[regionPicker.selectedRow(inComponent: 0)]
        changeAnnotationOnMap(to: currCity)
    }
}

extension MapTabViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
}

extension MapTabViewController {
    func changeAnnotationOnMap(to cityName: String) {
       
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(cityName) { (placemark,error) in
            if let error = error {
                print("Fail to Find the City.")
                print("Error Occured: \(error)")
                return
            }
            
            guard let location = placemark?.first?.location else {
                print("Cannot Find Loction on Maps for City \(cityName)")
                return
            }
            
            let annotation = MKPointAnnotation()
            annotation.title = cityName
            annotation.coordinate = location.coordinate
            
            let region = MKCoordinateRegion(
                center: location.coordinate,
                latitudinalMeters: 15000,
                longitudinalMeters: 15000
            )
            
            self.mapView.addAnnotation(annotation)
            self.mapView.setRegion(region, animated: true)
            
        }
    }
    
    
}
