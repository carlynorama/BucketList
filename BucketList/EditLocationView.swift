//
//  EditLocationView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/16/21.
//
//

import SwiftUI

struct EditLocationView: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    
    
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var locationStore:LocationsStore
    @Binding var placemark:Location
    
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    TextField("Place name", text: $placemark.title)
                    TextField("Description", text: $placemark.subtitle)
                }
                
                Section(header: Text("Nearby...")) {
                    if loadingState == .loaded {
                        List(pages, id: \.pageid) { page in
                            Text(page.title).font(.headline)
                            + Text(": ") +
                                Text(page.description).italic()
                        }
                    } else if loadingState == .loading {
                        ProgressView()
                    } else {
                        Text("Please try again later")
                    }
                }
                
                
            }
            .navigationBarTitle("Edit Location Details")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
            .onAppear(perform: fetchNearbyPlaces)
        }
    }
    
    //TODO: Rewrite as async
    func fetchNearbyPlaces() {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(placemark.coordinate.latitude)%7C\(placemark.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                // we got some data back!
                print("got data")
                let decoder = JSONDecoder()
                
                if let items = try? decoder.decode(Result.self, from: data) {
                    // success ??? convert the array values to our pages array
                    self.pages = Array(items.query.pages.values).sorted()
                    self.loadingState = .loaded
                    print("made pages")
                    return
                }
            }
            print("did not decode")
            // if we're still here it means the request failed somehow
            self.loadingState = .failed
        }.resume()
    }
    
}



//struct EditLocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditLocationView()
//    }
//}
