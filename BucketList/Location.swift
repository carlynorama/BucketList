//
//  Location.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//
//  TODO: Return title and subtitle to optionals and Re-add wrapped value getter and setter once EditLocationView stops crashing?

import Foundation
import MapKit

struct Location: Identifiable, Codable {
    let id = UUID()
    var title: String = "No title data"
    var subtitle: String = "No subtitle"
    let coordinate: CLLocationCoordinate2D
    
    
    func idMatch(_ locationToCheck:Location) -> Bool {
        self.id == locationToCheck.id
    }
    
    func coordinateMatch(_ locationToCheck:Location) -> Bool {
        self.coordinate.latitude == locationToCheck.coordinate.latitude && self.coordinate.longitude == locationToCheck.coordinate.longitude
    }
    
    public init(coordinate:CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: CodingKey {
        case title, subtitle, latitude, longitude
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(subtitle, forKey: .subtitle)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
    }
    
}

