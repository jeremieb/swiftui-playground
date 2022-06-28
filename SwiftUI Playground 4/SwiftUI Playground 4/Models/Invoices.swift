//
//  Invoices.swift
//  SwiftUI Playground 4
//
//  Created by Jérémie Berduck on 28/06/2022.
//

import Foundation

struct Invoices: Identifiable {
    var id = UUID()
    var client: String
    var invoiceID: String?
    var timestamp: Date
    var dueDate: Date
    var amount: Double
    var note: String?
}

let invoicesData: [Invoices] = [
    .init(client: "Apple Inc.", timestamp: Date(), dueDate: Date("2022-06-06"), amount: 2345.34),
    .init(client: "Sofa Limited", timestamp: Date(), dueDate: Date("2022-06-23"), amount: 2723.90),
    .init(client: "Homebridge", timestamp: Date(), dueDate: Date("2022-07-3"), amount: 3783.90),
    .init(client: "ACME Inc.", timestamp: Date(), dueDate: Date("2022-08-11"), amount: 1378.00),
    .init(client: "Marvelous Soft", timestamp: Date(), dueDate: Date("2022-09-08"), amount: 1723.00),
    .init(client: "Teenage Engineering", timestamp: Date(), dueDate: Date("2022-10-04"), amount: 876.10),
]

// Adding a simple date from a string
// -> https://stackoverflow.com/a/24090354/7729503
extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}
