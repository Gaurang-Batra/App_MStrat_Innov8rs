//
//  ExpenseDataModel.swift
//  App_MStrat_8
//
//  Created by student-2 on 26/12/24.
//

import Foundation
import UIKit

enum ExpenseCategory: String, CaseIterable {
    case car = "Car"
    case rent = "Rent"
    case grocery = "Grocery"
    case gym = "Gym"
    case other = "Other"
}

struct Expense {
    let id: Int
    var itemName: String
    var amount: Int
    var image: UIImage
    var category: ExpenseCategory
    var duration: Date?
    var isRecurring: Bool
}

let firstExpense = Expense(
    id: 1,
    itemName: "Buy a New Laptop",
    amount: 1200,
    image: UIImage(named: "laptop")!,
    category: .other,
    duration: DateFormatter().date(from: "2025-01-15"),
    isRecurring: false
)

let secondExpense = Expense(
    id: 2,
    itemName: "Vacation Fund",
    amount: 3000,
    image: UIImage(named: "vacation")!,
    category: .other,
    duration: DateFormatter().date(from: "2025-06-01"),
    isRecurring: true
)

let thirdExpense = Expense(
    id: 3,
    itemName: "Emergency Savings",
    amount: 5000,
    image: UIImage(named: "savings")!,
    category: .other,
    duration: DateFormatter().date(from: "2025-12-31"),
    isRecurring: true
)

class ExpenseDataModel {
    private var expenses: [Expense] = []
    static let shared = ExpenseDataModel()

    private init() {
        expenses.append(firstExpense)
        expenses.append(secondExpense)
        expenses.append(thirdExpense)
    }

    func getAllExpenses() -> [Expense] {
        return self.expenses
    }

    func addExpense(_ expense: Expense) {
        if ExpenseCategory.allCases.contains(expense.category) {
            expenses.append(expense)
            AllowanceDataModel.shared.deductExpense(fromAllowance: 0, expenseAmount: Double(expense.amount))
        } else {
            print("Invalid category. Expense not added.")
        }
    }

    func checkRecurringExpenses() {
        let currentDate = Date()

        for expense in expenses {
            if expense.isRecurring, let duration = expense.duration {
                if Calendar.current.isDate(currentDate, inSameDayAs: duration) {
                    promptUserForRecurringExpense(expense)
                }
            }
        }
    }

    private func promptUserForRecurringExpense(_ expense: Expense) {
        print("Do you want to add \(expense.itemName) again?")
    }
}
