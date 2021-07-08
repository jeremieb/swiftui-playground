//
//  Constants.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 08/07/2021.
//

import SwiftUI

struct Constants {
    
    #if os(iOS)
    public let deviceWidth = UIScreen.main.bounds.size.width
    public let deviceHeight = UIScreen.main.bounds.size.height
    #endif
    
    
}
