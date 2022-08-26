//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Wesley Patterson on 8/14/22.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    let id = UUID()
    let name : String
    let type : String
    let amount : Double
}
