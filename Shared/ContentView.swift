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
                        HStack(alignment: .center) {
                            Image(systemName: view.icon)
                            VStack {
                                Text(view.title)
                                Text(view.description).font(.subheadline)
                            }
                        }
                    })
                
            }.navigationTitle("SwiftUI Playground")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
