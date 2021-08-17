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
            
            ScrollView {
                
                Section(
                    header: SectionHeaderView(title: "Main"),
                    
                    content: {
                    
                    // Slider View
                    NavigationLink(
                        destination: SliderView(),
                        label: {
                            NavigationLabelView(view: MyViews(title: "Slider ", description: "Read a slider value", icon: "slider.horizontal.below.rectangle"))
                        })
                    Divider()

                    }).padding(.top)
  
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

// MARK: Section Header View
struct SectionHeaderView: View {
    
    var title: String = "My Section"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .textCase(.uppercase)
                    .font(.footnote)
                    .foregroundColor(.accentColor)
            }
            Spacer()
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .background(Color.accentColor.opacity(0.2))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
