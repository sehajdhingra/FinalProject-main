//
//  Tasks.swift
//  FinalProject
//
//  Created by Nadia Begum on 30/07/2024.
//

import SwiftUI
import SwiftData

struct Tasks: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                     .font(.system(size: 35))
                     .fontWeight(.semibold)
                     .offset(x: 10)
                Spacer()
                Button {
                    withAnimation {
                        self.showNewTask = true
                    }
                } label: {
                    Image("addButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    
                }
            }.padding()
            List {
                    ForEach (toDos) { toDoItem in
                            Text(toDoItem.title)
                    }
                    .onDelete(perform: deleteToDo)
            }
        }
        Spacer()
        if showNewTask {
            NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
        }
    }
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    Tasks()
}
