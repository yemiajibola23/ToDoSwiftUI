//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Yemi Ajibola on 1/30/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    
    @State var showCreateView = false
    @State var toDoItemToEdit: ToDoItem?
    @Query(filter: #Predicate { !$0.isCompleted }, sort: \ToDoItem.timestamp, order: .reverse) private var items: [ToDoItem]
    
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
                            withAnimation {
                                item.isCompleted.toggle()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? Color.green : Color.gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                        Button {
                            toDoItemToEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                                .tint(.orange)
                        }
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
            .sheet(item: $toDoItemToEdit) { item in
                UpdateToDoView(item: item)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
