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
                
                // MARK: SWIFTUI 3
                Section(header: SectionHeaderView(title: "SwiftUI 3", color: .blue)) {
                    
                    // Pull to refresh
                    NavigationLink (
                        destination: PullToRefreshView(),
                        label: {
                            NavigationLabelView(view: MyViews(title: "Pull to refresh", description: "A simple pull to refresh appending an array", icon: "arrow.down.circle.fill", color: .blue))
                        }
                    )
                    
                    Divider()
                    
                    // List
                    NavigationLink (
                        destination: ListCustomViews(),
                        label: {
                            NavigationLabelView(view: MyViews(title: "List customization", description: "List with custom design.", icon: "list.dash", color: .blue))
                        }
                    )
                    
                }.padding(.top)
                
                // MARK: SWIFTUI 2
                Section(
                    header: SectionHeaderView(title: "SwiftUI 2")) {
                        
                        // Slider View
                        NavigationLink(
                            destination: SliderView(),
                            label: {
                                NavigationLabelView(view: MyViews(title: "Slider ", description: "Read a slider value", icon: "slider.horizontal.below.rectangle"))
                            }
                        )
                        Divider()
                        
                        //Group Box
                        NavigationLink(
                            destination: GroupBoxView(),
                            label: {
                                NavigationLabelView(view: MyViews(title: "Simple Group Box", description: "A list of group box", icon: "square.grid.2x2.fill"))
                            }
                        )
                        Divider()
                        
                        // Advanced Group Box
                        NavigationLink (
                            destination: GroupBoxAdvancedView(),
                            label: {
                                NavigationLabelView(view: MyViews(title: "Advanced Group Box", description: "Next level grouped boxes...", icon: "rectangle.grid.1x2.fill"))
                            }
                        )
                        Divider()
                        
                    }.padding(.top)
                
            }
            .navigationTitle("SwiftUI Playground")
            .navigationBarItems(trailing: NavigationToolItemsView())
        }
    }
}

// MARK: Navigation Items View
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
            NavigationView {
                SettingsView().navigationBarTitle("Settings")
            }
        }
    }
}

// MARK: Section Header View
struct SectionHeaderView: View {
    
    var title: String = "My Section"
    var color: Color = .accentColor
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .textCase(.uppercase)
                    .font(.footnote)
                    .foregroundColor(color)
            }
            Spacer()
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .background(color.opacity(0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
