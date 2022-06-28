//
//  MyCharts.swift
//  SwiftUI Playground 4
//
//  Created by Jérémie Berduck on 28/06/2022.
//

import SwiftUI
import Charts

struct MyCharts: View {
    var body: some View {
        ScrollView {
            GroupBox("Invoices") {
                Chart(invoicesData, id: \.id) { invoice in
                    BarMark (
                        x: .value("Something", invoice.dueDate),
                        y: .value(invoice.client, invoice.amount)
                    )
                }
            }.frame(minHeight: 250)
        }
        .navigationTitle("My Invoices")
        .padding()
    }
}

struct MyCharts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyCharts()
        }
    }
}
