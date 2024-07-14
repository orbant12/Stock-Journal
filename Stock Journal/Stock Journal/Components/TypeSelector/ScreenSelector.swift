//
//  AddNewView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 12..
//

import SwiftUI

struct ScreenSelector: View {
    
    @State var selectedType = ""
    @State var selectedScreen: Screen = .scrhome
    
    
    
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .top){
                Group{
                    switch selectedScreen {
                    case .scrvideo:
                        OtherAddView()
                    case .scrbook:
                        BookAddView()
                    case .scrhome:
                        AddNewView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack{
                    Spacer()
                    TypeSelectorBar(selectedType: $selectedType, selectedScreen: $selectedScreen)
                }
                
            }
            
        }
    }
}
    
    struct ScreenSelector_Previews: PreviewProvider {
        
        static var previews: some View {
            
            ScreenSelector()
        }
    }
    
    

