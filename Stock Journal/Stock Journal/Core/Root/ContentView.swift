//
//  ContentView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 07. 30..
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                TabBarView()
            } else {
                UserYetView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
