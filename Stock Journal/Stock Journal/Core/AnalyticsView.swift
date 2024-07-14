//
//  AnalyticsView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 05. 29..
//

import SwiftUI

struct AnalyticsView: View {
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
                    
                    Spacer().frame(width: 100.0, height: 600.0)
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView(), label:{
                            Image(systemName: "house").resizable().frame(width: 30.0, height: 30.0)
                        } )
                        Spacer()
                            Image(systemName: "chart.bar.fill").resizable().frame(width: 40, height: 35.0)
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
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
        
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
