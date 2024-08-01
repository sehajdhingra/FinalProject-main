//
//  ToDoItem.swift
//  FinalProject
//
//  Created by Nadia Begum on 31/07/2024.
//

import Foundation
import SwiftData

@Model
class ToDoItem {
    var title: String
    
    init(title: String, isImportant: Bool = false) {
          self.title = title
    }
}
