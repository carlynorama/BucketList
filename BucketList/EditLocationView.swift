//
//  EditLocationView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//

import SwiftUI

struct EditLocationView: View {
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var locations:LocationsStore
    @Binding var location:Location
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $location.title)
                    TextField("Description", text: $location.subtitle)
                }
            }
            .navigationBarTitle("Edit \(location.title)")
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
