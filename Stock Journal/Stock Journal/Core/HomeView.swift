//
//  HomeView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 05. 29..
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.orange, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing).ignoresSafeArea()
                VStack{
                    Text("Datum")
                        .font(.body)
                        .fontWeight(.bold)
                    }
                    Spacer().frame(width: 100.0, height: 600.0)
                    HStack{
                        Spacer()
                        Image(systemName: "house.circle.fill").resizable().frame(width: 50.0, height: 50.0)
                        Spacer()
                        NavigationLink(destination: AnalyticsView(), label: {
                            Image(systemName: "chart.bar").resizable().frame(width: 30, height: 25.0)
                        })
                        Spacer()
                        NavigationLink(destination: MemoryView(), label: {
                            Image(systemName: "brain.head.profile").resizable().frame(width: 30.0, height: 30.0)
                        })
                        Spacer()
                        NavigationLink(destination: SettingsView(), label: {
                            Image(systemName: "person.text.rectangle").resizable().frame(width: 35.0, height: 30.0)
                        })
                        Spacer()
                    }
                    .frame(width: 350.0, height: 80.0).background(.white).cornerRadius(20)
                    
                }
                
            }
            
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
