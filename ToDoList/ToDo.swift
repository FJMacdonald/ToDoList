//
//  ToDo.swift
//  ToDoList
//
//  Created by Francesca MACDONALD on 2023-08-25.
//

import Foundation

struct ToDo: Identifiable, Codable {
 //   let id = UUID().uuidString //creates a unique instance of each struct with a constant Universally Unique Identified
    var id: String? // When a struct property is defined as an optional, it is nil when it's created unless it is exlicitly initialized.
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false

}
