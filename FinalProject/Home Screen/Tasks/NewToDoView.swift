//
//  NewToDoView.swift
//  FinalProject
//
//  Created by Nadia Begum on 31/07/2024.
//

import SwiftUI
import SwiftData


struct NewToDoView: View {
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask: Bool
    
    var body: some View {
        VStack {
            Text("Task Title: ")
                .font(.title)
                .fontWeight(.bold)
                .offset(y: 15)
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            Button {
                addToDo()
                self.showNewTask = false
            } label: {
                Image("saveButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .offset(y: -15)
            }

        }
    }
    
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title)
        modelContext.insert(toDo)
    }
} 

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDoView(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}
