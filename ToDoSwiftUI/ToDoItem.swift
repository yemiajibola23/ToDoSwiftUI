//
//  ToDoItem.swift
//  ToDoSwiftUI
//
//  Created by Yemi Ajibola on 1/30/25.
//

import Foundation
import SwiftData

@Model
final class ToDoItem {
    var title: String
    var timestamp: Date
    var isCompleted: Bool
    var isCritical: Bool
    
    init(title: String = "", timestamp: Date = .now, isCompleted: Bool = false, isCritical: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCompleted = isCompleted
        self.isCritical = isCritical
    }
}
