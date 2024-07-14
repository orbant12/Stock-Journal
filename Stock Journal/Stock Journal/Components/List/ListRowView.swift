//
//  ListRowView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 12..
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(item.title)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Finance", isCompleted: false)
    
    static var item2 = ItemModel(title: "Gym", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
            
        }.previewLayout(.sizeThatFits)
    }
}
