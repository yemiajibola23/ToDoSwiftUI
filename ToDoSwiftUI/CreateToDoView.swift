//
//  CreateToDoView.swift
//  ToDoSwiftUI
//
//  Created by Yemi Ajibola on 1/30/25.
//

import SwiftUI

struct CreateToDoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            TextField("Name", text: .constant(""))
            DatePicker("Choose date", selection: .constant(.now))
            Toggle("Important", isOn: .constant(false))
            
            Button("Create") {
                dismiss()
            }
        }
        .navigationTitle("Create ToDo")
    }
}

#Preview {
    CreateToDoView()
}
