//
//  Location.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//

import Foundation
import MapKit

struct Location: Identifiable {    
    let id = UUID()
    var title: String = "Unnamed"
    var subtitle: String = "Unnamed"
    let coordinate: CLLocationCoordinate2D
    
    
    func idMatch(_ locationToCheck:Location) -> Bool {
        self.id == locationToCheck.id
    }
    
    func coordinateMatch(_ locationToCheck:Location) -> Bool {
        self.coordinate.latitude == locationToCheck.coordinate.latitude && self.coordinate.longitude == locationToCheck.coordinate.longitude
    }
    
}

