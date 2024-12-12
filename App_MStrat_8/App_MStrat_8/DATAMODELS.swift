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

// Structure to represent a user
struct User {
    let id: Int
    var fullName: String?
    var email: String
    var password: String
    var phoneNumber: String?
    var isVerified: Bool
}

// Example user data
let firstUser = User(
    id: 1,
    fullName: "John Doe",
    email: "johndoe@example.com",
    password: "password123",
    phoneNumber: "+1234567890",
    isVerified: true
)

let secondUser = User(
    id: 2,
    fullName: "Jane Smith",
    email: "janesmith@example.com",
    password: "password456",
    phoneNumber: "+0987654321",
    isVerified: false
)

let thirdUser = User(
    id: 3,
    fullName: "Alice Johnson",
    email: "alicej@example.com",
    password: "password789",
    phoneNumber: nil,
    isVerified: true
)

// Singleton class to manage users
class UserDataModel {
    private var users: [User] = []
    static let shared = UserDataModel()

    private init() {
        users.append(firstUser)
        users.append(secondUser)
        users.append(thirdUser)
    }

    // Method to get all users
    func getAllUsers() -> [User] {
        return self.users
    }

    // Method to find a user by email
    func getUser(by email: String) -> User? {
        return users.first { $0.email == email }
    }

    // Method to find verified users
    func getVerifiedUsers() -> [User] {
        return users.filter { $0.isVerified }
    }

    // Method to add a new user
    func addUser(_ user: User) {
        users.append(user)
    }
}

// Example user data
let firstUser = User(
    id: UUID(),
    fullName: "John Doe",
    email: "johndoe@example.com",
    password: "password123",
    phoneNumber: "+1234567890",
    isVerified: true
)

let secondUser = User(
    id: UUID(),
    fullName: "Jane Smith",
    email: "janesmith@example.com",
    password: "password456",
    phoneNumber: "+0987654321",
    isVerified: false
)

let thirdUser = User(
    id: UUID(),
    fullName: "Alice Johnson",
    email: "alicej@example.com",
    password: "password789",
    phoneNumber: nil,
    isVerified: true
)

// Singleton class to manage users
class UserDataModel {
    private var users: [User] = []
    static let shared = UserDataModel()

    private init() {
        users.append(firstUser)
        users.append(secondUser)
        users.append(thirdUser)
    }

    // Method to get all users
    func getAllUsers() -> [User] {
        return self.users
    }

    // Method to find a user by email
    func getUser(by email: String) -> User? {
        return users.first { $0.email == email }
    }

    // Method to find verified users
    func getVerifiedUsers() -> [User] {
        return users.filter { $0.isVerified }
    }

    // Method to add a new user
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

// Singleton class to manage allowances
class AllowanceDataModel {
    private var allowances: [Allowance] = []
    static let shared = AllowanceDataModel()

    private init() {
        allowances.append(firstAllowance)
        allowances.append(secondAllowance)
        allowances.append(thirdAllowance)
    }

    // Method to get all allowances
    func getAllAllowances() -> [Allowance] {
        return self.allowances
    }

    // Method to find allowances by duration
    func getAllowances(by duration: Duration) -> [Allowance] {
        return allowances.filter { $0.duration == duration }
    }

    // Method to add a new allowance
    func addAllowance(_ allowance: Allowance) {
        allowances.append(allowance)
    }
}


struct AddGoal {
  var title : String
  var amount : String
  var deadline : String
}

// Example goal data
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

// Singleton class to manage goals
class GoalDataModel {
    private var goals: [AddGoal] = []
    static let shared = GoalDataModel()

    private init() {
        goals.append(firstGoal)
        goals.append(secondGoal)
        goals.append(thirdGoal)
    }

    // Method to get all goals
    func getAllGoals() -> [AddGoal] {
        return self.goals
    }

    // Method to add a new goal
    func addGoal(_ goal: AddGoal) {
        goals.append(goal)
    }
}


struct category
{
  var name : String
  var image : UIImage
}

struct Addexpense{
  let id: INT
  var itemname : String
  var amount : Int
  var image : UIImage
  var category : String
  var duration : Date?
  var reocurong : Bool
}
// Example goal data
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

// Singleton class to manage goals
class GoalDataModel {
    private var goals: [AddGoal] = []
    static let shared = GoalDataModel()

    private init() {
        goals.append(firstGoal)
        goals.append(secondGoal)
        goals.append(thirdGoal)
    }

    // Method to get all goals
    func getAllGoals() -> [AddGoal] {
        return self.goals
    }

    // Method to add a new goal
    func addGoal(_ goal: AddGoal) {
        goals.append(goal)
    }
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


// Singleton class to manage expense splits
class SplitExpenseDataModel {
    private var expenseSplits: [ExpenseSplitForm] = []
    static let shared = SplitExpenseDataModel()

    private init() {
        // Sample data for testing
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

        expenseSplits.append(firstExpenseSplit)
        expenseSplits.append(secondExpenseSplit)
    }

    // Method to get all expense splits
    func getAllExpenseSplits() -> [ExpenseSplitForm] {
        return self.expenseSplits
    }

    // Method to add a new expense split
    func addExpenseSplit(_ expenseSplit: ExpenseSplitForm) {
        expenseSplits.append(expenseSplit)
    }

    // Method to calculate the split amount for each person (for "equally" split option)
    func calculateEquallySplit(for expense: ExpenseSplitForm) -> [String: Double]? {
        guard expense.splitOption == .equally else { return nil }

        let splitAmount = expense.totalAmount / Double(expenseSplits.count)
        var splitAmounts: [String: Double] = [:]
        for split in expenseSplits {
            splitAmounts[split.paidBy] = splitAmount
        }
        return splitAmounts
    }

    // Method to calculate the split amount for each person (for "unequally" split option)
    func calculateUnequallySplit(for expense: ExpenseSplitForm) -> [String: Double]? {
        guard expense.splitOption == .unequally else { return nil }
        
        // This assumes that `splitAmounts` is already provided for unequal splits.
        return expense.splitAmounts
    }
}

// Example usage
let splitExpense = SplitExpenseDataModel.shared.getAllExpenseSplits()

// Singleton class to manage expense splits
class SplitExpenseDataModel {
    private var expenseSplits: [ExpenseSplitForm] = []
    static let shared = SplitExpenseDataModel()

    private init() {
        // Sample data for testing
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

        expenseSplits.append(firstExpenseSplit)
        expenseSplits.append(secondExpenseSplit)
    }

    // Method to get all expense splits
    func getAllExpenseSplits() -> [ExpenseSplitForm] {
        return self.expenseSplits
    }

    // Method to add a new expense split
    func addExpenseSplit(_ expenseSplit: ExpenseSplitForm) {
        expenseSplits.append(expenseSplit)
    }

    // Method to calculate the split amount for each person (for "equally" split option)
    func calculateEquallySplit(for expense: ExpenseSplitForm) -> [String: Double]? {
        guard expense.splitOption == .equally else { return nil }

        let splitAmount = expense.totalAmount / Double(expenseSplits.count)
        var splitAmounts: [String: Double] = [:]
        for split in expenseSplits {
            splitAmounts[split.paidBy] = splitAmount
        }
        return splitAmounts
    }

    // Method to calculate the split amount for each person (for "unequally" split option)
    func calculateUnequallySplit(for expense: ExpenseSplitForm) -> [String: Double]? {
        guard expense.splitOption == .unequally else { return nil }
        
        // This assumes that `splitAmounts` is already provided for unequal splits.
        return expense.splitAmounts
    }
}

// Example usage
let splitExpense = SplitExpenseDataModel.shared.getAllExpenseSplits()



// Enum to represent split options
enum SplitOption {
    case equally
    case unequally
}

// Structure to represent an expense split form
struct ExpenseSplitForm {
    var name: String
    var category: String
    var totalAmount: Double
    var paidBy: String
    var image: UIImage
    var splitOption: SplitOption
    var splitAmounts: [String: Double]?
}
import Foundation

// Structure to represent a member in a group
struct Member {
    var name: String
    var userID: String
    var status: MemberStatus
}

// Enum to represent the status of a member
enum MemberStatus {
    case joined
    case pending
}

// Structure to represent a group
struct Group {
    var groupName: String
    var category: String
    var members: [Member]
    var pendingRequests: [Member]
}

// Singleton class to manage groups
class GroupDataModel {
    private var groups: [Group] = []
    static let shared = GroupDataModel()

    private init() {
        // Sample data for testing
        let member1 = Member(name: "John", userID: "user_123", status: .joined)
        let member2 = Member(name: "Mary", userID: "user_456", status: .joined)
        let member3 = Member(name: "Alex", userID: "user_789", status: .pending)

        let group1 = Group(groupName: "Study Group", category: "Education", members: [member1, member2], pendingRequests: [member3])
        groups.append(group1)
    }

    // Method to get all groups
    func getAllGroups() -> [Group] {
        return self.groups
    }

    // Method to add a new group
    func addGroup(_ group: Group) {
        groups.append(group)
    }

    // Method to add a new member to an existing group
    func addMember(to groupName: String, member: Member) {
        if let index = groups.firstIndex(where: { $0.groupName == groupName }) {
            groups[index].members.append(member)
        }
    }

    // Method to approve a pending request for a member
    func approveMemberRequest(for groupName: String, memberID: String) {
        if let index = groups.firstIndex(where: { $0.groupName == groupName }) {
            if let memberIndex = groups[index].pendingRequests.firstIndex(where: { $0.userID == memberID }) {
                let approvedMember = groups[index].pendingRequests.remove(at: memberIndex)
                var updatedMember = approvedMember
                updatedMember.status = .joined
                groups[index].members.append(updatedMember)
            }
        }
    }

    // Method to get members of a specific group
    func getMembers(of groupName: String) -> [Member]? {
        return groups.first { $0.groupName == groupName }?.members
    }

    // Method to get pending requests of a specific group
    func getPendingRequests(of groupName: String) -> [Member]? {
        return groups.first { $0.groupName == groupName }?.pendingRequests
    }
}

// Example usage
let allGroups = GroupDataModel.shared.getAllGroups()
