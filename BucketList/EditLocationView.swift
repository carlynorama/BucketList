//
//  EditLocationView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//

import SwiftUI

struct EditLocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var locationStore:LocationsStore
    //@Binding var location:Location
    
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $locationStore.locations[locationStore.selectedLocationIndex].title)
                    TextField("Description", text: $locationStore.locations[locationStore.selectedLocationIndex].subtitle)
                }
            }
            .navigationBarTitle("Edit \(locationStore.locations[locationStore.selectedLocationIndex].title)")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
}

//struct EditLocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditLocationView()
//    }
//}
