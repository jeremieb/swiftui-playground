//
//  DetailView.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 08/07/2021.
//

import SwiftUI

struct DetailView: View {
    
    var item: MyViews
    
    var body: some View {
        VStack {
            Text(item.title).font(.title)
            Text(item.description)
        }
    }
}

struct PlaceholderView: View {
    var body: some View {
        Text("Placeholder View").font(.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: MyViewsList.first!)
    }
}
