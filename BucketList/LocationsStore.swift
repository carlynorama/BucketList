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
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")

        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([Location].self, from: data)
        } catch {
            print("Unable to load saved data.")
        }
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
}
