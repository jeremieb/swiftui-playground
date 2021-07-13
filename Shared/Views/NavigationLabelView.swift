//
//  SwiftUIView.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 13/07/2021.
//

import SwiftUI

struct NavigationLabelView: View {
    
    var view: MyViews
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: view.icon).foregroundColor(.accentColor)
            VStack {
                Text(view.title).fontWeight(.semibold)
                Text(view.description).font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLabelView(view: MyViewsList.first!)
    }
}
