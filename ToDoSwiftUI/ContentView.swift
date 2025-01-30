//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Yemi Ajibola on 1/30/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var showCreateView = false
    @Query private var items: [ToDoItem]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            if item.isCritical {
                                Image(systemName: "exclamationmark.2")
                                    .symbolVariant(.fill)
                                    .foregroundStyle(Color.red)
                                    .font(.largeTitle)
                                    .bold()
                                
                            }
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                            
                            Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? Color.green : Color.gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("My Todos")
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
