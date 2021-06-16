//
//  MapiOS14Example.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/15/21.
//


import MapKit
import SwiftUI

struct MapiOS14Example: View {
    @State private var locations: [Mark] = []
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(
                    coordinate: location.coordinate,
                    anchorPoint: CGPoint(x: 0.5, y: 0.7)
                ) {
                    VStack{
                        if location.show {
                            Text("Test")
                        }
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                            .onTapGesture {
                                let index: Int = locations.firstIndex(where: {$0.id == location.id})!
                                locations[index].show.toggle()
                            }
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
                    Button(action: {
                        locations.append(Mark(coordinate: region.center))
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(20)
                }
            }
        }
        .ignoresSafeArea()
    }
}
struct MapiOS14Example_Previews: PreviewProvider {
    static var previews: some View {
        MapKitExampleView()
    }
}
struct Mark: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    var show = false
}

