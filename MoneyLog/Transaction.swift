//
//  Item.swift
//  MoneyLog
//
//  Created by tanya on 15/12/2023.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    @Attribute(.unique) let id: String
    let timestamp: Date
    let amount: Decimal
    let type: TransactionTypeString
    let name: String
    var amountText: String {
        "\(amount)"
    }
    init(timestamp: Date, amount: Decimal) {
        self.timestamp = timestamp
        self.id = UUID().uuidString
        self.amount = amount
        self.type = TransactionType.none.rawValue
        self.name = ""
    }
}

typealias TransactionTypeString = String
enum TransactionType: String {
    case none
}
