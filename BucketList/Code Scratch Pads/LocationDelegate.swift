//
//  LocationDelegate.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//

import MapKit

// To Use: 
//    @State var trackingMode: MapUserTrackingMode = .follow
//    @State var manager = CLLocationManager()
//    @StateObject var managerDelegate = LocationDelegate()
    

class LocationDelegate: NSObject, ObservableObject, CLLocationManagerDelegate         {

    @Published var  region = MKCoordinateRegion.init(MKMapRect.world)

   func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
       if manager.authorizationStatus == .authorizedWhenInUse {
           print("Authorized...")
           manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
           manager.startUpdatingLocation()
       } else {
           print("Not Authorized...")
           manager.requestWhenInUseAuthorization()
       }
   }

   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       print("Updated Location")
       region.center.latitude = (manager.location?.coordinate.latitude)!
       region.center.longitude = (manager.location?.coordinate.longitude)!
   }
}
