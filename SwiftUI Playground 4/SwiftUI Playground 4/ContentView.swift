//
//  ContentView.swift
//  SwiftUI Playground 4
//
//  Created by Jérémie Berduck on 28/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            List {
                
                // Swift Charts Examples
                NavigationLink(destination: MyCharts(), label: {
                    Label("My Invoices (chart)", systemImage: "chart.bar.fill")
                })
                
            }
            .navigationTitle("SwiftUI Playground")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
