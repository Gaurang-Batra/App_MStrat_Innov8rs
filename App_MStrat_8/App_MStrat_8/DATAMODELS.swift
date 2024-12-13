//
//  DATAMODELS.swift
//  App_MStrat_8
//
// UserDataModel.swift
//
// Created by Ankush Sharma on 12/12/24.
import Foundation
import UIKit
<<<<<<< HEAD

struct User {
    let id: Int
    var fullName: String
=======
struct User {
    let id: Int
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
    var email: String
    var fullname: String
    var password: String
    var isVerified: Bool
    var badges: [String]
    var currentGoal: Goal?
}

enum GoalType {
    case daily
    case weekly
    case monthly
    case yearly
    case custom
}

let firstUser = User(
    id: 1,
    email: "johndoe@example.com",
    fullname: "John Doe",
    password: "password123",
<<<<<<< HEAD
    
    isVerified: true
=======
    isVerified: true,
    badges: [],
    currentGoal: nil
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
)
let secondUser = User(
    id: 2,
    email: "janesmith@example.com",
    fullname: "Jane Smith",
    password: "password456",
<<<<<<< HEAD

    isVerified: false
=======
    isVerified: false,
    badges: [],
    currentGoal: nil
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
)
let thirdUser = User(
    id: 3,
    email: "alicej@example.com",
    fullname: "Alice Johnson",
    password: "password789",
<<<<<<< HEAD

    isVerified: true
=======
    isVerified: true,
    badges: [],
    currentGoal: nil
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
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

<<<<<<< HEAD
    func getUser(by email: String) -> User? {
        return users.first { $0.email == email }
    }

    func getVerifiedUsers() -> [User] {
        return users.filter { $0.isVerified }
    }

    func addUser(_ user: User) {
        users.append(user)
=======
    func getUser(by id: Int) -> User? {
        return users.first { $0.id == id }
    }

    func assignGoal(to userId: Int, goal: Goal) {
        guard let index = users.firstIndex(where: { $0.id == userId }) else { return }
        users[index].currentGoal = goal

        let badge: String
        switch goal.type {
        case .yearly:
            badge = "Monthly Achiever"
        case .monthly:
            badge = "Weekly Achiever"
        case .weekly:
            badge = "Daily Achiever"
        case .daily:
            badge = "Quick Challenger"
        case .custom:
            badge = "Custom Achiever"
        }

        users[index].badges.append(badge)
    }

    func getUserBadges(for userId: Int) -> [String] {
        return users.first { $0.id == userId }?.badges ?? []
    }
}

struct Goal {
    let id: Int
    var title: String
    var amount: Int
    var deadline: Date
    var type: GoalType
}

let firstGoal = Goal(id: 1, title: "Buy a New Laptop", amount: 1200, deadline: DateFormatter().date(from: "2025-01-15")!, type: .yearly)
let secondGoal = Goal(id: 2, title: "Vacation Fund", amount: 3000, deadline: DateFormatter().date(from: "2025-06-01")!, type: .monthly)
let thirdGoal = Goal(id: 3, title: "Emergency Savings", amount: 5000, deadline: DateFormatter().date(from: "2025-12-31")!, type: .daily)

class GoalDataModel {
    private var goals: [Goal] = []
    static let shared = GoalDataModel()

    private init() {
        goals.append(firstGoal)
        goals.append(secondGoal)
        goals.append(thirdGoal)
    }

    func getAllGoals() -> [Goal] {
        return self.goals
    }

    func addGoal(_ goal: Goal) {
        goals.append(goal)
    }

    func getGoal(by id: Int) -> Goal? {
        return goals.first { $0.id == id }
    }

    func deleteGoal(by id: Int) {
        if let index = goals.firstIndex(where: { $0.id == id }) {
            goals.remove(at: index)
        }
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
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

let firstAllowance = Allowance(amount: 50.0, isRecurring: true, duration: .oneWeek, customDate: nil)
let secondAllowance = Allowance(amount: 100.0, isRecurring: false, duration: nil, customDate: Date())
let thirdAllowance = Allowance(amount: 75.0, isRecurring: true, duration: .oneMonth, customDate: nil)

<<<<<<< HEAD
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

=======
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
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

<<<<<<< HEAD
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

=======
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
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
<<<<<<< HEAD


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
=======

let firstExpense = AddExpense(id: 1, itemName: "Buy a New Laptop", amount: 1200, image: UIImage(named: "laptop")!, category: "Electronics", duration: DateFormatter().date(from: "2025-01-15"), isRecurring: false)
let secondExpense = AddExpense(id: 2, itemName: "Vacation Fund", amount: 3000, image: UIImage(named: "vacation")!, category: "Travel", duration: DateFormatter().date(from: "2025-06-01"), isRecurring: true)
let thirdExpense = AddExpense(id: 3, itemName: "Emergency Savings", amount: 5000, image: UIImage(named: "savings")!, category: "Finance", duration: DateFormatter().date(from: "2025-12-31"), isRecurring: true)

class ExpenseDataModel {
    private var expenses: [AddExpense] = []
    static let shared = ExpenseDataModel()

    private init() {
        expenses.append(firstExpense)
        expenses.append(secondExpense)
        expenses.append(thirdExpense)
    }

    func getAllExpenses() -> [AddExpense] {
        return self.expenses
    }

    func addExpense(_ expense: AddExpense) {
        expenses.append(expense)
    }

    func checkRecurringExpenses() {
        let currentDate = Date()
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7

        for expense in expenses {
            if expense.isRecurring, let duration = expense.duration {
                if Calendar.current.isDate(currentDate, inSameDayAs: duration) {
                    promptUserForRecurringExpense(expense)
                }
            }
        }
    }

<<<<<<< HEAD
    func calculateUnequallySplit(for expense: ExpenseSplitForm) -> [String: Double]? {
        guard expense.splitOption == .unequally else { return nil }
        
       
        return expense.splitAmounts
    }
}

enum SplitOption {
    case equally
    case unequally
}
=======
    private func promptUserForRecurringExpense(_ expense: AddExpense) {
        print("Do you want to add \(expense.itemName) again?")
        addExpense(expense)
    }
}

struct Group {
    var groupName: String
    var category: String
    var members: [Int]
}

class GroupDataModel {
    private var groups: [Group] = []
    private var users: [User] = []
    
    static let shared = GroupDataModel()

    private init() {
        users.append(User(id: 101, email: "user1@example.com", password: "password", isVerified: true, badges: [], currentGoal: nil))
        users.append(User(id: 102, email: "user2@example.com", password: "password", isVerified: true, badges: [], currentGoal: nil))
        users.append(User(id: 103, email: "user3@example.com", password: "password", isVerified: true, badges: [], currentGoal: nil))
        
        groups.append(Group(groupName: "Tech Lovers", category: "Technology", members: [101, 102]))
        groups.append(Group(groupName: "Travel Enthusiasts", category: "Travel", members: [103]))
    }

    func createGroup(groupName: String, category: String, members: [Int]) {
        let newGroup = Group(groupName: groupName, category: category, members: members)
        groups.append(newGroup)
    }

    func addMemberToGroup(groupName: String, userId: Int) {
        if let groupIndex = groups.firstIndex(where: { $0.groupName == groupName }) {
            if !groups[groupIndex].members.contains(userId) {
                groups[groupIndex].members.append(userId)
            }
        }
    }

    func getAllGroups() -> [Group] {
        return self.groups
    }

    func getGroupByName(groupName: String) -> Group? {
        return groups.first { $0.groupName == groupName }
    }
}

struct ExpenseCard {
    var name: String
    var image: UIImage
    var amount: Int
}

>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
struct ExpenseSplitForm {
    var name: String
    var category: String
    var totalAmount: Double
    var paidBy: String
    var image: UIImage
    var splitOption: SplitOption
    var splitAmounts: [String: Double]?
}

<<<<<<< HEAD
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
    
=======
enum SplitOption {
    case equally
    case unequally
}

class SplitExpenseDataModel {
    private var expenseSplits: [ExpenseSplitForm] = []
    static let shared = SplitExpenseDataModel()

    private init() {
        let firstExpenseSplit = ExpenseSplitForm(name: "Dinner with Friends", category: "Food", totalAmount: 100.0, paidBy: "John Doe", image: UIImage(named: "dinner.jpg")!, splitOption: .equally, splitAmounts: nil)
        let secondExpenseSplit = ExpenseSplitForm(name: "Trip Expense", category: "Travel", totalAmount: 500.0, paidBy: "Alice Johnson", image: UIImage(named: "trip.jpg")!, splitOption: .unequally, splitAmounts: ["John Doe": 200.0, "Alice Johnson": 300.0])
        expenseSplits.append(firstExpenseSplit)
        expenseSplits.append(secondExpenseSplit)
    }

    func getAllExpenseSplits() -> [ExpenseSplitForm] {
        return self.expenseSplits
    }
>>>>>>> ef44b1c45accb097385439de83f51774f0c184c7
}
