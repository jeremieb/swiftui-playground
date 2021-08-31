//
//  PullToRefreshView.swift
//  PullToRefreshView
//
//  Created by Jérémie Berduck on 31/08/2021.
//

import SwiftUI

struct PullToRefreshView: View {
    
    @State var data = Array(0..<10)
    
    var body: some View {
        
        List(data, id: \.self) { item in
            Text(item.description)
            
        }
        .refreshable {
            await loadMore()
        }
        .navigationTitle("Pull to refresh")
        .navigationBarItems(trailing:
                                Button(action: {
            Task.init {
                await loadMore() // 1
            }
        }, label: {
            Image(systemName: "arrow.clockwise.circle")
        })
        )
    }
    
    public func loadMore() async {
        let request = URLRequest(url: URL(string: "https://httpbin.org/delay/2")!)
        let _ = try! await URLSession.shared.data(for: request)
        data.append(contentsOf: (Array(0..<20)))
    }
}

struct PullToRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshView()
    }
}
