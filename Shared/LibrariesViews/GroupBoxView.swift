//
//  GroupBoxView.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 17/08/2021.
//

import SwiftUI

struct GroupBoxView: View {
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(), .init()]) {
                ForEach(0..<10) { _ in
                    GroupBox(
                        label: Label("Heart Rate", systemImage: "heart.fill")
                            .foregroundColor(.red)
                    ) {
                        Text("Your hear rate is 90 BPM.")
                    }.groupBoxStyle(CardGroupBoxStyle())
                }
            }.padding()
        }
    }
    
}

// MARK: Box List
struct MyGroupBoxList: Hashable {
    var title: String
    var icon: String = "dot.square.fill"
    var description: String
    var color: Color = .red
}

// MARK: Box Main Style
struct CardGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct GroupBoxView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxView()
    }
}
