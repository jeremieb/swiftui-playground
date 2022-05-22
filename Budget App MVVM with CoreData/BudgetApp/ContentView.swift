//
//  ContentView.swift
//  Shared
//
//  Created by Jérémie Berduck on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var budgetListVM: BudgetListViewModel

    init(vm: BudgetListViewModel) {
        self.budgetListVM = vm
    }
    
    private func deleteBudget(at offset: IndexSet) {
        offset.forEach { index in
            let budget = budgetListVM.budgets[index]
            budgetListVM.deleteBudget(budgetId: budget.id)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(budgetListVM.budgets) { budget in
                        Text(budget.title)
                    }.onDelete(perform: deleteBudget)
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                // Dismiss action
            }, content: {
                AddBudgetScreen(vm: AddBudgetViewModel(context: viewContext))
            })
            
            .navigationTitle("Budget")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add New Budget") {
                        isPresented = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        ContentView(vm: BudgetListViewModel(context: viewContext))
    }
}
