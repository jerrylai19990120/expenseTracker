//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by Jerry Lai on 2021-02-26.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation


struct Transaction: Hashable {
    var category: String
    var note: String
    var date: String
    var amount: Int
    var isIncome: Bool
}
