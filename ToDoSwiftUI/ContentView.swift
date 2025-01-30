//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Yemi Ajibola on 1/30/25.
//

import SwiftUI

struct ContentView: View {
    @State var showCreateView = false
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItem {
                        Button {
                            showCreateView.toggle()
                        } label: {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showCreateView) {
                    NavigationStack {
                        CreateToDoView()
                    }
                    .presentationDetents([.medium])
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
