//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Francesca MACDONALD on 2023-08-24.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Swift",
    "Build Apps",
    "Change the World",
    "Bring the Awesome",
    "Take a Vaccation"]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(toDos, id: \.self) { toDo in
                        
                        NavigationLink {
                            DetailView(passedValue: toDo)
                        } label: {
                            Text(toDo)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .navigationTitle("To Do List")
                .navigationBarTitleDisplayMode(.automatic)
                .listStyle(.plain)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
