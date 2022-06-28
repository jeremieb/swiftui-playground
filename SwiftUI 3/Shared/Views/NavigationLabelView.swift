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
            Image(systemName: view.icon).foregroundColor(view.color ?? .accentColor)
            VStack(alignment: .leading) {
                Text(view.title).fontWeight(.semibold).foregroundColor(view.color ?? .accentColor)
                Text(view.description).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(.gray).opacity(0.4)
        }.padding(.horizontal, 8)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLabelView(view: MyViews(title: "Test", description: "Lorem"))
    }
}
