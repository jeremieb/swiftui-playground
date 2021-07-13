//
//  ContentView.swift
//  Shared
//
//  Created by Jeremie Berduck on 08/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List(MyViewsList, id: \.self) { view in
                NavigationLink(
                    destination: DetailView(item: view),
                    label: {
                        NavigationLabelView(view: view)
                    })
                
            }
            .navigationTitle("SwiftUI Playground")
            .navigationBarItems(trailing: NavigationToolItemsView())
        }
    }
}

// MARK: NAVIGATION TOOL ITEMS
struct NavigationToolItemsView: View {
    
    @State private var showSettings: Bool = false

    var body: some View {
        
        // Open Settings View
        Button(action: {
            showSettings.toggle()
        }, label: {
            Image(systemName: "gearshape.fill")
        })
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
