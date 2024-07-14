//
//  ListView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 12..
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Finance", isCompleted: false),
        ItemModel(title: "Health", isCompleted: true),
        ItemModel(title: "Gym", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                Text("hi")
                //ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}


