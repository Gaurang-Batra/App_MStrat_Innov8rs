//
//  splitPalGroupsDataModel.swift
//  App_MStrat_8
//
//  Created by student-2 on 26/12/24.
//

import Foundation

struct Group {
    var id: Int
    var groupName: String
    var category: String
    var members: [Int]
    var expenses: [ExpenseSplitForm]?
}

class GroupDataModel {
    private var groups: [Group] = []
    private var users: [User] = []
    
    static let shared = GroupDataModel()

    private init() {
        // Sample users
        users.append(User(id: 101, email: "user1@example.com", fullname: "John", password: "password", isVerified: true, badges: [], currentGoal: nil, expenses: []))
        users.append(User(id: 102, email: "user2@example.com", fullname: "Steve", password: "password", isVerified: true, badges: [], currentGoal: nil, expenses: []))
        users.append(User(id: 103, email: "user3@example.com", fullname: "Jack", password: "password", isVerified: true, badges: [], currentGoal: nil, expenses: []))

        // Sample groups
        groups.append(Group(
            id: 1,
            groupName: "Tech Lovers",
            category: "Technology",
            members: [101, 102],
            expenses: nil
        ))
        groups.append(Group(
            id: 2,
            groupName: "Travel Enthusiasts",
            category: "Travel",
            members: [103],
            expenses: nil
        ))
    }

    func createGroup(groupName: String, category: String, members: [Int]) {
        let newGroup = Group(id: (groups.last?.id ?? 0) + 1, groupName: groupName, category: category, members: members, expenses: nil)
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

    func addExpenseToGroup(expense: ExpenseSplitForm) {
        guard let groupIndex = groups.firstIndex(where: { $0.id == expense.groupId }) else {
            print("Group not found!")
            return
        }

        // Check if expenses array exists; if not, initialize it
        if groups[groupIndex].expenses == nil {
            groups[groupIndex].expenses = []
        }

        // Add the expense to the group's expense list
        groups[groupIndex].expenses?.append(expense)

        // Notify group members about the new expense
        let group = groups[groupIndex]
        for memberId in group.members {
            if let user = users.first(where: { $0.id == memberId }) {
                print("Notifying \(user.fullname) about the new expense: \(expense.name)")
            }
        }
    }

    func getExpensesForGroup(groupId: Int) -> [ExpenseSplitForm]? {
        return groups.first(where: { $0.id == groupId })?.expenses
    }
}
