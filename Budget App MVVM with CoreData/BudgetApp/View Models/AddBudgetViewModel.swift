//
//  AddBudgetViewModel.swift
//  Budget App MVVM with CoreData (iOS)
//
//  Created by Jérémie Berduck on 20/05/2022.
//

import Foundation
import CoreData

class AddBudgetViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var total: String = ""
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let budget = Budget(context: context)
            budget.title = name
            budget.total = Double(total) ?? 0
            try budget.save()
        } catch {
            print(error)
        }
    }
}
