//
//  MK+ExampleData.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/14/21.
//

import Foundation
import MapKit

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
    
}
