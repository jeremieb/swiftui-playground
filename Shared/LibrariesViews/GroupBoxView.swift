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
                ForEach(myGroupBoxList, id: \.self) { box in
                    GroupBox(
                        label: Label(box.title, systemImage: box.icon)
                            .foregroundColor(box.color)
                    ) {
                        Text(box.description)
                            .font(.footnote)
                            .padding(.top, 4)
                            .fixedSize(horizontal: false, vertical: true)
                    }.groupBoxStyle(CardGroupBoxStyle())
                }
            }.padding()
        }
    }
    
    private var myGroupBoxList: [MyGroupBox] = [
        MyGroupBox(title: "Hear Rate", icon: "heart.fill", description: "You heart rate is 90 BPM.", color: .red),
        MyGroupBox(title: "Walking", icon: "figure.walk", description: "You have walk 3.45 km today", color: .green),
        MyGroupBox(title: "Noise", icon: "ear.fill", description: "You've been in a noisy environment today", color: .orange)
    ]
}

// MARK: Box List
struct MyGroupBox: Hashable {
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
