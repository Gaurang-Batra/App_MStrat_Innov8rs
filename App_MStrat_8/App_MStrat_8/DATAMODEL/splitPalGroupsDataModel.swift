//
//  splitPalGroupsDataModel.swift
//  App_MStrat_8
//
//  Created by student-2 on 26/12/24.
//

import Foundation

struct Group {
    var id : Int
    var groupName: String
    var category: String
    var members: [Int]
}

class GroupDataModel {
    private var groups: [Group] = []
    private var users: [User] = []
    
    static let shared = GroupDataModel()

    private init() {
        users.append(User(id: 101, email: "user1@example.com", fullname: "john", password: "password", isVerified: true, badges: [], currentGoal: nil, expenses: []))
        users.append(User(id: 102, email: "user2@example.com", fullname: "steve", password: "password", isVerified: true, badges: [], currentGoal: nil, expenses: []))
        users.append(User(id: 103, email: "user3@example.com", fullname: "jack", password: "password", isVerified: true, badges: [], currentGoal: nil, expenses: []))
        
        groups.append(Group(id: 1, groupName: "Tech Lovers", category: "Technology", members: [101, 102]))
        groups.append(Group(id: 3, groupName: "Travel Enthusiasts", category: "Travel", members: [103]))
    }

    func createGroup(groupName: String, category: String, members: [Int]) {
        let newGroup = Group(id: (groups.last?.id ?? 0) + 1, groupName: groupName, category: category, members: members)
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

    func addSplitExpense(expense: ExpenseSplitForm) {
        guard let groupIndex = groups.firstIndex(where: { $0.id == expense.groupId }) else { return }

        let group = groups[groupIndex]
        let memberIds = group.members

        for memberId in memberIds {
            if let user = users.first(where: { $0.id == memberId }) {
                print("Notifying \(user.fullname) about the new expense: \(expense.name)")
            }
        }
    }
}
