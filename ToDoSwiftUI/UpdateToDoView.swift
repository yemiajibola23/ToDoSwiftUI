//
//  UpdateToDoView.swift
//  ToDoSwiftUI
//
//  Created by Yemi Ajibola on 1/30/25.
//

import SwiftUI

struct UpdateToDoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @Bindable var item: ToDoItem
    var body: some View {
        List {
            TextField("Name", text: $item.title)
            DatePicker("Choose date", selection: $item.timestamp)
            Toggle("Important", isOn: $item.isCritical)
            
            Button("Update") {
                dismiss()
            }
        }
        .navigationTitle("Update ToDo")
    }
}
