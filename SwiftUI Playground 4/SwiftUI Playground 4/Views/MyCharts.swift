//
//  MyCharts.swift
//  SwiftUI Playground 4
//
//  Created by Jérémie Berduck on 28/06/2022.
//

import SwiftUI
import Charts

struct MyCharts: View {
    
    private enum SelectedChart {
        case schedule
        case clients
    }

    @State private var selected: SelectedChart = .schedule
    
    var body: some View {
        ScrollView {
            Picker(selection: $selected, label: EmptyView()) {
                Text("Schedule").tag(SelectedChart.schedule)
                Text("Clients").tag(SelectedChart.clients)
            }.pickerStyle(.segmented)
            
            switch selected {
            case .schedule:
                scheduleChart()
            case .clients:
                clientsChart()
            }
        }.animation(.easeInOut(duration: 0.450), value: selected)
        .navigationTitle("My Invoices")
        .padding()
    }
    
    // MARK: Schedule Chart
    @ViewBuilder
    func scheduleChart() -> some View {
        GroupBox("Schedule") {
            Chart {
                ForEach(invoicesData, id: \.id) { invoice in
                    BarMark (
                        x: .value("Schedule", invoice.dueDate, unit: .month),
                        y: .value("Amount", invoice.amount)
                    ).foregroundStyle(by: .value("Schedule", invoice.dueDate, unit: .month))
                    LineMark(
                        x: .value("Schedule", invoice.dueDate, unit: .month),
                        y: .value("Amount", invoice.amount)
                    ).foregroundStyle(Color.blue).interpolationMethod(.cardinal)
                }
            }
        }.frame(minHeight: 250).animation(.easeInOut, value: selected)
    }
    
    // MARK: Clients Chart
    @ViewBuilder
    func clientsChart() -> some View {
        GroupBox("Clients") {
            Chart(invoicesData, id: \.client) { invoice in
                BarMark(
                    x: .value("Amount", invoice.amount),
                    y: .value("Clients", invoice.client)
                ).foregroundStyle(by: .value("Clients", invoice.client))
            }.chartLegend(.hidden)
        }.frame(minHeight: 350).animation(.easeInOut, value: selected)
    }
}

struct MyCharts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyCharts()
        }
    }
}
