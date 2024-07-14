//
//  ytTutorial.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 14..
//

import SwiftUI



struct ytTutorial: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: SigninView(), label: {
                    Rectangle()
                        .overlay(
                            Text("Finish")
                        )
                        .frame(width: 300, height: 100)
                        .cornerRadius(30)
                        
                })
            }
        }
        
        
    }
}

struct audioTutorial: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: SigninView(), label: {
                    Rectangle()
                        .overlay(
                            Text("Finish")
                        )
                        .frame(width: 300, height: 100)
                        .cornerRadius(30)
                        
                })
            }
        }
    }
}

struct bookTutorial: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: SigninView(), label: {
                    Rectangle()
                        .overlay(
                            Text("Finish")
                        )
                        .frame(width: 300, height: 100)
                        .cornerRadius(30)
                        
                })
            }
        }
    }
}

struct ytTutorial_Previews: PreviewProvider {
    static var previews: some View {
        ytTutorial()
    }
}
