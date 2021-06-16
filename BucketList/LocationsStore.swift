//
//  LocationsStore.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//

import Foundation


class LocationsStore:ObservableObject {
    @Published var locations:[Location] = []
    @Published var theOneShowingDetails:Location?
    
    func indexOf(_ locationToIndex:Location) -> Int? {
        locations.firstIndex(where: { locationToIndex.idMatch($0)  })
    }
    
    var selectedLocationIndex:Int {
        indexOf(theOneShowingDetails!)!
    }
    
    func shouldShowDetails(_ location:Location) -> Bool{
        location.idMatch(theOneShowingDetails!)
    }
    
    var all:[Location] {
        locations
    }
    
    func append(_ location:Location) {
        locations.append(location)
    }
    
}
