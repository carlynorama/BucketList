//
//  MostBasicMapView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/14/21.
//

import SwiftUI
import MapKit

struct MostBasicMapView: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MostBasicMapView

        init(_ parent: MostBasicMapView) {
            self.parent = parent
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
        //
    }

}

struct MostBasicMapView_Previews: PreviewProvider {
    static var previews: some View {
        MostBasicMapView()
    }
}
