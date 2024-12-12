//
//  DATAMODELS.swift
//  App_MStrat_8
//
//  Created by student-2 on 11/12/24.
//

import Foundation
import UIKit



struct User {
    let id: UUID
    var fullName: String?
    var email: String
    var password: String
    var phoneNumber: String?
    var isVerified: Bool
}
 

struct Allowance {
    var amount: Double
    var isRecurring: Bool
    var duration: Duration?
    var customDate: Date?

   
}
enum Duration: String {
    case oneWeek = "1 Week"
    case twoWeeks = "2 Weeks"
    case oneMonth = "1 Month"
    case twoMonths = "2 Months"
}

struct AddGoal {
  var title : String
  var amount : String
  var deadline : String
}

//let form = ItemForm(
//    itemName: "Groceries",
//    amount: 100.0,
//    category: "Food",
//    isRecurring: true,
//    duration: .custom,
//    date: Date() // Custom date selected by the user
//)


struct category
{
  var name : String
  var image : UIImage
}

struct Addexpense{
  let id: UUID
  var itemname : String
  var amount : Int
  var image : UIImage
  var category : String
  var duration : Date?
  var reocurong : Bool
}

struct expensecard
{
  var name : String
  var image : UIImage
  var amount : Int
}

//let expense = ExpenseForm(
//    itemName: "Gym Subscription",
//    amount: 50.0,
//    selectedCategory: "GYM",
//    duration: Calendar.current.date(byAdding: .month, value: 1, to: Date()), // One month from today
//    isRecurring: true
//)


struct ExpenseSplitForm {
    var name: String
    var category: String
    var totalAmount: Double
    var paidBy: String
    var image : UIImage
    var splitOption: SplitOption
    var splitAmounts: [String: Double]?
}

enum SplitOption {
    case equally
    case unequally
}

let expense = ExpenseSplitForm(
    name: "Dinner",
    category: "Food",
    totalAmount: 100.0,
    paidBy: "John",
    splitOption: .equally,
    splitAmounts: nil // Not needed when split equally
)


let expense1 = ExpenseSplitForm(
    name: "Dinner",
    category: "Food",
    totalAmount: 100.0,
    paidBy: "John",
    splitOption: .unequally,
    splitAmounts: [
        "John": 40.0,
        "Mary": 30.0,
        "Alex": 30.0
    ]
)


struct Group {
    var groupName: String
    var category: String
    var members: [Member]
    var pendingRequests: [Member]
}

struct Member {
    var name: String
    var userID: String
    var status: MemberStatus
}

enum MemberStatus {
    case joined
    case pending
}

let member1 = Member(name: "John", userID: "user_123", status: .joined)
let member2 = Member(name: "Mary", userID: "user_456", status: .joined)
let pendingMember = Member(name: "Alex", userID: "user_789", status: .pending)
