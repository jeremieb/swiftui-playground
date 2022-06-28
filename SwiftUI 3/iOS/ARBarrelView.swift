//
//  ARBarrelView.swift
//  SwiftUI Playground (iOS)
//
//  Created by Jérémie Berduck on 05/10/2021.
//

import SwiftUI
import RealityKit

struct ARBarrelView: View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! BarrelExperience.loadScene()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ARBarrelView_Previews: PreviewProvider {
    static var previews: some View {
        ARBarrelView()
    }
}
