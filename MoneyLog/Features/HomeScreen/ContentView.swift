//
//  ContentView.swift
//  MoneyLog
//
//  Created by tanya on 15/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Transaction]

    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text("$27")
                    .font(.headline)
                Text("Today left in my pocket")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))

            HStack {
                Text("Budget $40")
                Spacer()
                Text("Spent $48")
                    .foregroundColor(.red)
            }
            ProgressView(value: 0.09)
                .tint(.red)
            HStack {
                Text("Tomorrow's budget: $37")
                Spacer()
                Text("Over budget: $8")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        Spacer()
                        Text(item.amountText)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Transaction(timestamp: Date(), amount: 1.25)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Transaction.self, inMemory: true)
}


