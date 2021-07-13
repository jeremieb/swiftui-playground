//
//  SettingsView.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 13/07/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Image(systemName: "gearshape.fill")
        }.navigationTitle(Text("My Settings"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
