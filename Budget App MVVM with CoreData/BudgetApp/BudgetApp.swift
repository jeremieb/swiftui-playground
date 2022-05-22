//
//  Budget_App_MVVM_with_CoreDataApp.swift
//  Shared
//
//  Created by Jérémie Berduck on 20/05/2022.
//

import SwiftUI

@main
struct BudgetApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            ContentView(vm: BudgetListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}


// -> https://youtu.be/gGM_Qn3CUfQ
