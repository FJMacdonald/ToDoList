//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Francesca MACDONALD on 2023-08-24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(toDosVM.toDos) { toDo in
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            HStack {
                                Image(systemName: toDo.isCompleted ? "checkmark.square" : "square")
                                    .onTapGesture {
                                        toDosVM.toggleCompleted(toDo: toDo)
                                    }
                                Text(toDo.item)
                            }
                         }
                        .buttonStyle(.borderedProminent)
                    }
                    //When you swipe left, swiftUI will pass in the rows selected as an IndexSet
                    .onDelete { indexSet in
                        toDosVM.deleteToDo(indexSet: indexSet)
                    }
                    .onMove { fromOffsets, toOffset in
                        toDosVM.moveToDo(fromOffsets: fromOffsets, toOffset: toOffset)
                     }
                }
                .navigationTitle("To Do List")
                .navigationBarTitleDisplayMode(.automatic)
                .listStyle(.plain)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            sheetIsPresented.toggle()
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .sheet(isPresented: $sheetIsPresented) {
                    NavigationStack {
                        DetailView(toDo: ToDo())
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}
