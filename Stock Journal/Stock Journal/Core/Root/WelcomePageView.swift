//
//  WelcomePageView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 07. 30..
//

import SwiftUI

struct WelcomePageView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    func incrementPage() {
        pageIndex += 1
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $pageIndex){
                ForEach(pages) { page in
                    VStack{
                        Spacer()
                        PageView(page: page)
                        Spacer()
                        if page == pages.last {
                            Button("Get Started", action: incrementPage)
                                .padding(16)
                                .frame(maxWidth: .infinity)
                                .background(Color(.black))
                                .cornerRadius(16)
                                .padding(.horizontal,32)
                                .foregroundColor(.white)
                        }else{
                            Button("Next", action: incrementPage)
                                .padding(16)
                                .frame(maxWidth: .infinity)
                                .background(Color(.black))
                                .cornerRadius(16)
                                .padding(.horizontal,32)
                                .foregroundColor(.white)
                        }
                            
                        Spacer()
                    }
                    .tag(page.tag)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }
        
        
        
    }
}


struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
