//
//  AppLoadingView.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 08/06/2021.
//

import SwiftUI

struct AppLoadingView: View {
    var body: some View {
        VStack(spacing: 10) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            Text("Loading roster...")
        }
    }
}

struct AppLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AppLoadingView()
    }
}
