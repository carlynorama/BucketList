//
//  AnnotationView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//

import SwiftUI
import MapKit

struct AnnotationView: View {
    var location:Location
    var showDetails:Bool
    var tapAction: (Location) -> ()

    
    var body: some View {
        VStack {
                ZStack {
                    Rectangle().fill(Color.white)
                    HStack {
                        Text("\(location.title)")
                        Image(systemName: "info.circle.fill")
                    }
                }.opacity(showDetails ? 1:0)
                .onTapGesture {
                    if showDetails {
                        tapAction(location)
                    }
                }
        }
        HStack(alignment: .center, spacing:0) {
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
        }

    }
}
