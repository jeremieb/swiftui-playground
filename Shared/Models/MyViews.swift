//
//  File.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 08/07/2021.
//

import SwiftUI

struct MyViews: Hashable {
    
    var title: String
    var description: String
    var icon: String = "dot.square.fill"
    var view: String
    
}

let MyViewsList: [MyViews] = [

    MyViews(title: "First view", description: "A first view", view: "PlaceholderView("),
    MyViews(title: "Second view", description: "A second view", icon: "scribble", view: "PlaceholderView")

]
