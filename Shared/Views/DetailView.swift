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
            Image(systemName: item.icon)
                .font(.title)
                .foregroundColor(.accentColor)
            Text(item.description)
            
        }.navigationTitle(item.title)
    }
}

struct ChildView<Content: View>: View {
    var destinationView: Content
    var title: String

    init(destinationView: Content,  title: String) {
        self.destinationView = destinationView
        self.title = title
    }

    var body: some View {
        NavigationLink(destination: destinationView){
            Text("This item opens the \(title) view").foregroundColor(Color.black)
        }
    }
}

struct GreedyContainerView<Content: View>: View {
    
    var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
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
