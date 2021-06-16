//
//  MyMapView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/15/21.
//

import SwiftUI
import MapKit
import Combine

struct MyMapView: View {
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    
    @StateObject var locationStore = LocationsStore()
    @State private var region = MKCoordinateRegion.init(MKMapRect.world)

    private func toDoOnDetailsTap(_ location:Location) {
        showingPlaceDetails = true
        print("tapped: \(location)")
    }
    

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: .all, annotationItems: locationStore.all) { location in
                MapAnnotation(coordinate: location.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.75)) {
                    
                    if locationStore.theOneShowingDetails == nil {
                        AnnotationView(location: location, showDetails: false, tapAction: toDoOnDetailsTap)
                            .onTapGesture(perform: {
                                locationStore.theOneShowingDetails = location
                        })
                    } else {
                        AnnotationView(location: location, showDetails: locationStore.shouldShowDetails(location), tapAction: toDoOnDetailsTap)
                            .onTapGesture(perform: {
                                if location.idMatch(locationStore.theOneShowingDetails!) {
                                    locationStore.theOneShowingDetails = nil
                                } else {
                                    locationStore.theOneShowingDetails = location
                                }
                        })
                    }
                }
        }
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(
                        action: {
                            let newLocation = //Location(coordinate: managerDelegate.region.center)
                                Location(coordinate: region.center)
                            self.locationStore.append(newLocation)
                            print("location:\(newLocation)")
                        }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
                
            }
        }
        .alert(isPresented: $showingPlaceDetails, content: {
            Alert(title: Text(locationStore.theOneShowingDetails?.title ?? "Unknown"), message: Text(locationStore.theOneShowingDetails?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                    // edit this place
                    self.showingEditScreen = true
                })
        })
        .sheet(isPresented: $showingEditScreen) {
            EditLocationView() //location: $locationStore.locations[locationStore.selectedLocationIndex]
        }
        .environmentObject(locationStore)
        
    }
}

struct MyMapView_Previews: PreviewProvider {
    static var previews: some View {
        MyMapView()
    }
}

