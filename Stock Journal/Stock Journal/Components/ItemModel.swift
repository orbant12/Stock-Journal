//
//  ItemModel.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 12..
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
