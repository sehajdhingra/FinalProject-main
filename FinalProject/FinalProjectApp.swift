//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by SriSai on 7/26/24.
//

import SwiftUI
import SwiftData

@main
struct FinalProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
