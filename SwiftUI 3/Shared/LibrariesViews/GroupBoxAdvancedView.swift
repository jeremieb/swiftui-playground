//
//  GroupBoxAdvancedView.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 18/08/2021.
//

import SwiftUI

struct GroupBoxAdvancedView: View {
    var body: some View {
        
        ScrollView {
            VStack(spacing: 8) {
                
                GroupBox(label: Label("Heart rate", systemImage: "heart.fill")) {
                    HealthValueView(value: "69", unit: "BPM")
                }.groupBoxStyle(HealthGroupBoxStyle(color: .red, destination: Text("Heart rate")))
                
                GroupBox(label: Label("Weight", systemImage: "figure.wave")) {
                    HealthValueView(value: "72.3", unit: "kg")
                }.groupBoxStyle(HealthGroupBoxStyle(color: .purple, destination: Text("Weight")))
                
                GroupBox(label: Label("Headphone noise level", systemImage: "ear")) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            (Text("\(Image(systemName: "checkmark.circle.fill"))").foregroundColor(.green) + Text(" OK")).font(.system(.headline, design: .rounded))
                            Text("7 days pressure").font(.system(.callout, design: .rounded)).foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }.groupBoxStyle(HealthGroupBoxStyle(color: .blue, destination: Text("Headphone noise level")))
                
                GroupBox(label: Label("Resting heart rate", systemImage: "heart.fill")) {
                    HealthValueView(value: "52", unit: "BPM")
                }.groupBoxStyle(HealthGroupBoxStyle(color: .red, destination: Text("Resting heart rate")))
                
                GroupBox(label: Label("Sleep analysis", systemImage: "bed.double.fill")) {
                    HStack {
                        HealthValueView(value: "8", unit: "h")
                        HealthValueView(value: "37", unit: "min").padding(.leading, -140)
                    }
                }.groupBoxStyle(HealthGroupBoxStyle(color: .orange, destination: Text("Sleep analysis")))
                
                GroupBox(label: Label("Steps", systemImage: "flame.fill")) {
                    HealthValueView(value: "4019", unit: "Steps")
                }.groupBoxStyle(HealthGroupBoxStyle(color: Color(red: 254 / 255, green: 87 / 255, blue: 45 / 255, opacity: 1), destination: Text("Steps")))
            }
            .navigationTitle("Health")
            .padding()
            .background(Color(.systemGroupedBackground))
            
            
        }
    }
}

struct HealthValueView: View {
    var value: String
    var unit: String
    
    @ScaledMetric var size: CGFloat = 1
    
    @ViewBuilder var body: some View {
        HStack {
            Text(value).font(.system(size: 24 * size, weight: .bold, design: .rounded)) + Text(" \(unit)").font(.system(size: 14 * size, weight: .semibold, design: .rounded)).foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct HealthGroupBoxStyle<V: View>: GroupBoxStyle {
    var color: Color
    var destination: V
    var date: Date?
    
    @ScaledMetric var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        NavigationLink(destination: destination) {
            GroupBox(label: HStack {
                configuration.label.foregroundColor(color)
                Spacer()
                if date != nil {
                    Text("\(date!)").font(.footnote).foregroundColor(.secondary).padding(.trailing, 4)
                }
                Image(systemName: "chevron.right").foregroundColor(Color(.systemGray4)).imageScale(.small)
            }) {
                configuration.content.padding(.top)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct GroupBoxAdvancedView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxAdvancedView()
    }
}
