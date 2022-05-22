//
//  AddBudgetScreen.swift
//  Budget App MVVM with CoreData (iOS)
//
//  Created by Jérémie Berduck on 20/05/2022.
//

import SwiftUI

struct AddBudgetScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: AddBudgetViewModel
    
    init(vm: AddBudgetViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter title for this budget:", text: $vm.name)
                TextField("Enter total:", text: $vm.total)
                
                Button("Save") {
                    vm.save()
                    presentationMode.wrappedValue.dismiss()
                }.centerHorizontally()
                
                .navigationTitle("Add Budget")
            }
        }
    }
}

struct AddBudgetScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        AddBudgetScreen(vm: AddBudgetViewModel(context: viewContext))
    }
}
