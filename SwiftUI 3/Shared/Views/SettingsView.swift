//
//  SettingsView.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 13/07/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    SettingsLabelView(label: "Thing", icon: "gearshape.fill", color: .red)
                })
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    SettingsLabelView(label: "Second Thing", icon: "paintbrush.fill", color: .blue)
                })
        }
    }
}

struct SettingsLabelView: View {
    
    var label: String
    var icon: String
    var color: Color = .red
    
    var body: some View {
        HStack {
            Image(systemName: icon).foregroundColor(color)
            Text(label)
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
