//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Francesca MACDONALD on 2023-08-24.
//

import SwiftUI

//@StateObject is used to create an object from an ObservableObject class.  Use it to create the first instance of an object that uses a class that conforms to ObservableObject.  CChanges to this objects @Published properties will announce themselves to SwiftUI and trigger interface updates.
@main
struct ToDoListApp: App {
    @StateObject var toDoVM = ToDosViewModel()
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDoVM)
        }
    }
}
