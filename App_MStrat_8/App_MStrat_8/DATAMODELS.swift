//
//  DATAMODELS.swift
//  App_MStrat_8
//
// UserDataModel.swift
// User Management System
//
// Created by Ankush Sharma on 12/12/24.
import Foundation
import UIKit

struct User {
    let id: Int
    var fullName: String
    var email: String
    var password: String
    var isVerified: Bool
}

let firstUser = User(
    id: 1,
    fullName: "John Doe",
    email: "johndoe@example.com",
    password: "password123",
    
    isVerified: true
)

let secondUser = User(
    id: 2,
    fullName: "Jane Smith",
    email: "janesmith@example.com",
    password: "password456",

    isVerified: false
)

let thirdUser = User(
    id: 3,
    fullName: "Alice Johnson",
    email: "alicej@example.com",
    password: "password789",

    isVerified: true
)

class UserDataModel {
    private var users: [User] = []
    static let shared = UserDataModel()

    private init() {
        users.append(firstUser)
        users.append(secondUser)
        users.append(thirdUser)
    }

    func getAllUsers() -> [User] {
        return self.users
    }

    func getUser(by email: String) -> User? {
        return users.first { $0.email == email }
    }

    func getVerifiedUsers() -> [User] {
        return users.filter { $0.isVerified }
    }

    func addUser(_ user: User) {
        users.append(user)
    }
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

let firstAllowance = Allowance(
    amount: 50.0,
    isRecurring: true,
    duration: .oneWeek,
    customDate: nil
)

let secondAllowance = Allowance(
    amount: 100.0,
    isRecurring: false,
    duration: nil,
    customDate: Date()
)

let thirdAllowance = Allowance(
    amount: 75.0,
    isRecurring: true,
    duration: .oneMonth,
    customDate: nil
)

class AllowanceDataModel {
    private var allowances: [Allowance] = []
    static let shared = AllowanceDataModel()

    private init() {
        allowances.append(firstAllowance)
        allowances.append(secondAllowance)
        allowances.append(thirdAllowance)
    }

    func getAllAllowances() -> [Allowance] {
        return self.allowances
    }

    func getAllowances(by duration: Duration) -> [Allowance] {
        return allowances.filter { $0.duration == duration }
    }

    func addAllowance(_ allowance: Allowance) {
        allowances.append(allowance)
    }
}

struct AddGoal {
    var title: String
    var amount: String
    var deadline: String
}

let firstGoal = AddGoal(
    title: "Buy a New Laptop",
    amount: "$1200",
    deadline: "2025-01-15"
)

let secondGoal = AddGoal(
    title: "Vacation Fund",
    amount: "$3000",
    deadline: "2025-06-01"
)

let thirdGoal = AddGoal(
    title: "Emergency Savings",
    amount: "$5000",
    deadline: "2025-12-31"
)

class GoalDataModel {
    private var goals: [AddGoal] = []
    static let shared = GoalDataModel()

    private init() {
        goals.append(firstGoal)
        goals.append(secondGoal)
        goals.append(thirdGoal)
    }

    func getAllGoals() -> [AddGoal] {
        return self.goals
    }

    func addGoal(_ goal: AddGoal) {
        goals.append(goal)
    }
}

struct Category {
    var name: String
    var image: UIImage
}

struct AddExpense {
    let id: Int
    var itemName: String
    var amount: Int
    var image: UIImage
    var category: String
    var duration: Date?
    var isRecurring: Bool
}


let firstExpenseSplit = ExpenseSplitForm(
    name: "Dinner with Friends",
    category: "Food",
    totalAmount: 100.0,
    paidBy: "John Doe",
    image: UIImage(named: "dinner.jpg")!,
    splitOption: .equally,
    splitAmounts: nil
)

let secondExpenseSplit = ExpenseSplitForm(
    name: "Trip Expense",
    category: "Travel",
    totalAmount: 500.0,
    paidBy: "Alice Johnson",
    image: UIImage(named: "trip.jpg")!,
    splitOption: .unequally,
    splitAmounts: ["John Doe": 200.0, "Alice Johnson": 300.0]
)

class SplitExpenseDataModel {
    private var expenseSplits: [ExpenseSplitForm] = []
    static let shared = SplitExpenseDataModel()

    private init() {
       
        expenseSplits.append(firstExpenseSplit)
        expenseSplits.append(secondExpenseSplit)
    }

    func getAllExpenseSplits() -> [ExpenseSplitForm] {
        return self.expenseSplits
    }

    func addExpenseSplit(_ expenseSplit: ExpenseSplitForm) {
        expenseSplits.append(expenseSplit)
    }

    func calculateEquallySplit(for expense: ExpenseSplitForm) -> [String: Double]? {
        guard expense.splitOption == .equally else { return nil }

        let splitAmount = expense.totalAmount / Double(expenseSplits.count)
        var splitAmounts: [String: Double] = [:]
        for split in expenseSplits {
            splitAmounts[split.paidBy] = splitAmount
        }
        return splitAmounts
    }

    func calculateUnequallySplit(for expense: ExpenseSplitForm) -> [String: Double]? {
        guard expense.splitOption == .unequally else { return nil }
        
       
        return expense.splitAmounts
    }
}

enum SplitOption {
    case equally
    case unequally
}
struct ExpenseSplitForm {
    var name: String
    var category: String
    var totalAmount: Double
    var paidBy: String
    var image: UIImage
    var splitOption: SplitOption
    var splitAmounts: [String: Double]?
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

struct Group {
    var groupName: String
    var category: String
    var members: [Member]
    var pendingRequests: [Member]
}

class GroupDataModel {
    private var groups: [Group] = []
    static let shared = GroupDataModel()
    
    private init() {
        let member1 = Member(name: "John", userID: "user_123", status: .joined)
        let member2 = Member(name: "Mary", userID: "user_456", status: .joined)
        let member3 = Member(name: "Alex", userID: "user_789", status: .pending)
        
        let group1 = Group(groupName: "Study Group", category: "Education", members: [member1, member2], pendingRequests: [member3])
        groups.append(group1)
    }
    
    func getAllGroups() -> [Group] {
        return self.groups
    }
    
    func addGroup(_ group: Group) {
        groups.append(group)
    }
    
    func addMember(to groupName: String, member: Member) {
        if let index = groups.firstIndex(where: { $0.groupName == groupName }) {
            groups[index].members.append(member)
        }
    }
    
}
