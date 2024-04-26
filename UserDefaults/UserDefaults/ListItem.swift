//
//  ListItem.swift
//  UserDefaults
//
//  Created by 渡邊 翔矢 on 2023/12/20.
//

import Foundation

struct ToDoItem: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var deadline: Date
    var completed: Bool
    
    init(title: String, description: String, deadline: Date, id: UUID, completed: Bool) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.deadline = deadline
        self.completed = completed
    }
}


