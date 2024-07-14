//
//  TabBarView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 12..
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab: Tab = .home
    @State var color: Color = .teal

    
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .bottom){
                
                Group{
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .explore:
                        ExploreView()
                    case .memory:
                        MemoryView()
                    case .settings:
                        ProfileView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack {
                    ForEach(tabItems) { item in
                        Button{
                            withAnimation(.spring(response: 0.3,
                                                  dampingFraction: 0.7)) {
                                selectedTab = item.tab
                                color = item.color
                            }
                        }label: {
                            VStack(spacing: 0){
                                Image(systemName: item.icon)
                                    .symbolVariant(.fill)
                                    .font(.body.bold())
                                    .frame(width: 44, height: 29)
                                Text(item.text)
                                    .font(.caption2)
                                    .lineLimit(1)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .foregroundStyle(selectedTab == item.tab ? .primary :
                                .secondary)
                        .blendMode(selectedTab == item.tab ? .overlay :
                                .normal)
                        
                    }
                }
                .padding(.horizontal, 8)
                .padding(.top, 14)
                .frame(height: 88, alignment: .top)
                .background(.ultraThinMaterial, in:
                                RoundedRectangle(cornerRadius: 20,style: .continuous))
                .overlay{
                    Circle()
                        .frame(width: 60, height: 60)
                        .padding(.bottom, 100)
                        .foregroundColor(.gray)
                        .cornerRadius(60)
                    
                        .overlay{
                            NavigationLink(destination: ScreenSelector(), label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.bottom,100)
                                    .zIndex(10)
                                    .foregroundColor(.black)
                            })
                        }
                }
                .background(
                    HStack {
                        if selectedTab == .settings { Spacer() }
                        if selectedTab == .explore { Spacer() }
                        if selectedTab == .memory {
                            Spacer()
                            Spacer()
                        }
                        Circle().fill(color).frame(width: 88)
                        if selectedTab == .home { Spacer() }
                        if selectedTab == . explore {
                            Spacer()
                            Spacer()
                        }
                        if selectedTab == .memory { Spacer() }
                    }
                        .padding(.horizontal, 8)
                )
                
                .overlay(
                    HStack {
                        if selectedTab == .settings { Spacer() }
                        if selectedTab == .explore { Spacer() }
                        if selectedTab == .memory {
                            Spacer()
                            Spacer()
                        }
                        Rectangle()
                            .fill(color)
                            .frame(width: 28, height: 5)
                            .cornerRadius(3)
                            .frame(width: 88)
                            .frame(maxHeight: .infinity, alignment: .top)
                        if selectedTab == .home { Spacer() }
                        if selectedTab == . explore {
                            Spacer()
                            Spacer()
                        }
                        if selectedTab == .memory { Spacer() }
                    }
                        .padding(.horizontal, 8)
                )
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                
            }
            
        
        }
    }
    
}
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
