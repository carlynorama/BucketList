//
//  MapView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/14/21.
//

import SwiftUI
import MapKit

struct UIMapView: UIViewRepresentable {
    @Binding var centerCoordinate:CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: UIMapView

        init(_ parent: UIMapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        //this is terrible.
        if annotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(annotations)
        }
        
        print("Updating: \(uiView.annotations)")
    }
    


}

struct UIMapView_Previews: PreviewProvider {
    static var previews: some View {
        UIMapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), annotations: [MKPointAnnotation.example])
            
    }
}

