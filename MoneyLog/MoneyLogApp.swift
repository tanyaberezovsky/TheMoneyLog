//
//  MoneyLogApp.swift
//  MoneyLog
//
//  Created by tanya on 15/12/2023.
//

import SwiftUI
import SwiftData

@main
struct MoneyLogApp: App {
    @State private var selectedTab: Tab = .home

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Transaction.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            VStack {
                switch selectedTab {
                case .home:
                    NavigationView {
                        FirstView()
                    }
                case .transactions:
                    NavigationView {
                        SecondView()
                    }
                }
                CustomTabView(selectedTab: $selectedTab)
                    .frame(height: 50)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
