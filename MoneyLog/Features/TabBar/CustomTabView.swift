//
//  CustomTabView.swift
//  MoneyLog
//
//  Created by tanya on 16/12/2023.
//

import SwiftUI

enum Tab {
    case home
    case transactions
}

struct FirstView: View {
    var body: some View {
        ContentView()
        Color(.systemGray6)
            .ignoresSafeArea()
            .navigationTitle("First view")
    }
}

struct SecondView: View {
    var body: some View {
        Color(.systemGray6)
            .ignoresSafeArea()
            .navigationTitle("second view")
    }
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        HStack {
            Spacer()
            Button {
                selectedTab = .home
            } label: {
                VStack {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("Home")
                        .font(.caption2)
                }
                .foregroundColor(selectedTab == .home ? Colors.Tab.selected : Colors.Tab.notselected)
            }
            .frame(width: 60, height: 50)
            Spacer()
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Colors.Tab.selected)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 2)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                }
                .offset(y: -2)
            }
            Spacer()
            
            Button {
                selectedTab = .transactions
            } label: {
                VStack {
                    Image(systemName: "chart.line.downtrend.xyaxis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("History")
                        .font(.caption2)
                }
                .foregroundColor(selectedTab == .transactions ? Colors.Tab.selected : Colors.Tab.notselected)
            }
            .frame(width: 60, height: 50)
            Spacer()
        }
    }
}

