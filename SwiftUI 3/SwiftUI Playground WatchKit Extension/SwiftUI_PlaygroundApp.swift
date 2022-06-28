//
//  SwiftUI_PlaygroundApp.swift
//  SwiftUI Playground WatchKit Extension
//
//  Created by Jeremie Berduck on 13/07/2021.
//

import SwiftUI

@main
struct SwiftUI_PlaygroundApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
