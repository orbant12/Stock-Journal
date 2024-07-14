//
//  Tab.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 12..
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home, color: .teal),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .pink),
    TabItem(text: "Memory", icon: "bookmark", tab: .memory, color: .red),
    TabItem(text: "Settings", icon: "person", tab: .settings, color: .green),
]

enum Tab: String {
    case home
    case explore
    case memory
    case settings
}
