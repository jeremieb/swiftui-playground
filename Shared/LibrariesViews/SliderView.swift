//
//  SliderView.swift
//  SwiftUI Playground
//
//  Created by Jeremie Berduck on 15/07/2021.
//

import SwiftUI

struct SliderView: View {
    
    @State private var sliderData: Double = 0
    
    var body: some View {
        VStack {
            Text("Slider value: \(sliderData, specifier: "%.2f")")
            Slider(value: $sliderData, in: 0...20, step: 1)
        }.padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
