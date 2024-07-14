//
//  PageModel.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 07. 30..
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample for debugging", imageUrl: "1", tag: 0)
    
    static var samplePages: [Page] = [
    Page(name: "Welcome to Default App!", description: "The best app to get stuff done", imageUrl: "1", tag: 0),
    Page(name: "Welcome to Default App!", description: "The best app to get stuff", imageUrl: "2", tag: 1),
    Page(name: "Welcome to Default App!", description: "The best app to get", imageUrl: "3", tag: 2)]
}
