//
//  ContentView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/14/21.
//

//info.plist had to add Privacy - FaceID

import SwiftUI
import MapKit


struct MapKitExampleView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    
    var body: some View {
        //BasicAuthenticationView()
        ZStack {
            UIMapView(centerCoordinate: $centerCoordinate, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // create a new location
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        print("location:\(newLocation)")
                    }) {
                        Image(systemName: "plus")
                    }
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
}

struct MapKitExampleView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitExampleView()
    }
}



