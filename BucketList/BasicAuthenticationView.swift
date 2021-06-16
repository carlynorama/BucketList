//
//  BasicAuthenticationView.swift
//  BucketList
//
//  Created by Carlyn Maw on 6/14/21.
//

import SwiftUI
import LocalAuthentication

struct BasicAuthenticationView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        //MapView().edgesIgnoringSafeArea(.all)
        
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
        
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        //self.isUnlocked = false
                    }
            }
            }
        } else {
            //no biometrics
        }
        

    }
}

struct BasicAuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAuthenticationView()
    }
}
