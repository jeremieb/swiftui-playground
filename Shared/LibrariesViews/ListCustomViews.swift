//
//  ListCustomViews.swift
//  ListCustomViews
//
//  Created by Jérémie Berduck on 02/09/2021.
//

import SwiftUI

struct ListCustomViews: View {
    
    @State private var messages: [String] = [
        "Messages", "with swipe", "actions"
    ]
    
    var body: some View {
        NavigationView {
            List(messages, id: \.self) { message in
                Text(message)
                    .listRowSeparatorTint(Color.blue.opacity(0.4))
                    .listRowSeparator(.automatic, edges: .all)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Remove", role: .destructive) {
                            messages.removeAll { $0 == message }
                        }
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Copy") {
                            messages.append(message)
                        }
                    }
            }.navigationTitle(Text("Messages List"))
        }
    }
}

struct ListCustomViews_Previews: PreviewProvider {
    static var previews: some View {
        ListCustomViews()
    }
}
