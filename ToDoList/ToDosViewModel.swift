//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Francesca MACDONALD on 2023-08-25.
//

import Foundation

//ObservableObject states that this class can create objects that have a property or properties that will publish changes that can be observed and trigger SwiftUI to redraw the user interface.

//An @EnvironmentObject is available across SwiftUI Views, so you don't have to pass an object from View to View after it has been created. (It is essentially available to the whole "environment" that is your app.
class ToDosViewModel: ObservableObject {
    //@Published propert wrapper announces changes and triggers the UI to redraw.
    //Works like @State but with classes that are ObservableObjects
    //Can be available accross multiple Views
    @Published var toDos: [ToDo] = []
    
    init() {
        loadData()
    }
    
    func toggleCompleted(toDo: ToDo) {
        guard toDo.id != nil else {return}
        
        if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
            toDos[index].isCompleted.toggle()
        }
        saveData()
    }
    
    func saveToDo(toDo: ToDo) {
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
                toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()

    }
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()

    }
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos) //try? means if an error is thrown, data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("😡 Error: Could not save data \(error.localizedDescription)")
        }
    }
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("😡 Error: Could not load data \(error.localizedDescription)")
        }
    }
    //to get rid of data for the preview simulator (means you don't need to delete the app to simulate an empty app.
    func purgeData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("") 
        do {
            try data?.write(to: path)
        } catch {
            print("😡 Error: Could not save data \(error.localizedDescription)")
        }
    }
}
