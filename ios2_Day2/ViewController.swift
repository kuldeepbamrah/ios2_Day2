//
//  ViewController.swift
//  ios2_Day2
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    //create a variable for location manager
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        //define lat and long
//        let latitude : CLLocationDegrees = 43.64
//        let longitude : CLLocationDegrees = -79.38
//
//
//        //define delta (difference) of lat and long
//        let latDelta : CLLocationDegrees = 0.05
//        let longDelta : CLLocationDegrees = 0.05
//
//        //define span
//        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//
//
//        //define location
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//        //define region
//        let region = MKCoordinateRegion(center: location, span: span)
//
//        // set the region on the map
//        mapView.setRegion(region, animated: true)
//
//
//        //adding annotation on the map
//        let annotation = MKPointAnnotation()
//        annotation.title  = "Toronto City"
//        annotation.subtitle = "The 6ix"
//        annotation.coordinate = location
//        mapView.addAnnotation(annotation)
//
//
//
//        //adding gesture recognizer
//        let gestureLongPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
//        mapView.addGestureRecognizer(gestureLongPress)
//
//
//
//
//        //show location feature
       locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
       locationManager.requestWhenInUseAuthorization()
        
       locationManager.startUpdatingLocation()
        

////        let tempLocation = locationManager.location
////        let region1 = MKCoordinateRegion(center: tempLocation!.coordinate, span: span)
////        mapView.setRegion(region1, animated: true)
////        let annotaion1 = MKPointAnnotation()
////        annotaion1.title = "You are Here"
////        annotaion1.coordinate = tempLocation!.coordinate
////        mapView.addAnnotation(annotaion1)
//
    }

    
    @objc func longPress(gestureRecognizer : UILongPressGestureRecognizer)
    {
        let touchPoint = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Latitude:\(coordinate.latitude)"
        annotation.subtitle = "Longitude:\(coordinate.longitude)"
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //grab user location
        let i = mapView.annotations.count
        let annotationsToRemove = mapView.annotations.filter { $0 !== mapView.userLocation }
        mapView.removeAnnotations( annotationsToRemove )
        
        let userLocation : CLLocation = locations[0]
        let lat = userLocation.coordinate.latitude
       let long = userLocation.coordinate.longitude
        //define delta (difference) of lat and long
        let latDelta : CLLocationDegrees = 0.05
       let longDelta : CLLocationDegrees = 0.05

//        //define span
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//
//
//        //define location
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
//
//        //define region
        let region = MKCoordinateRegion(center: location, span: span)
//
//        // set the region on the map
       mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "You are here"
       annotation.coordinate = userLocation.coordinate
        mapView.addAnnotation(annotation)
        
       
        
        
        //find the user address from his location
        //CLGeocoder().reverseGeocodeLocation()
    }

}

