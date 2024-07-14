//
//  TypeSelectorBar.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 12..
//

import SwiftUI

struct TypeSelectorBar: View {
    
    @Binding var selectedType: String
    @Binding var selectedScreen: Screen
    
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        HStack(spacing: 0){
            //Selector Bar Buttons
            
            TabBarButton(image: "video", selectedType: $selectedType, tabPoints: $tabPoints,selectedScreen:$selectedScreen)
            
            TabBarButton(image: "book", selectedType: $selectedType, tabPoints: $tabPoints,selectedScreen: $selectedScreen)
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
        )
        .overlay(
            Circle()
                .fill(Color.white)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 20)
            
            ,alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    func getCurvePoint()->CGFloat{
        
        if tabPoints.isEmpty{
            return 10
        }else{
            switch selectedType {
            case "video":
                return tabPoints[0]
            case "book":
                return tabPoints[1]
            default:
                return tabPoints[0] + 80
            }
        }
    }
}

struct TypeSelectorBar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
    }
}

struct TabBarButton: View {
    
    var image: String
    @Binding var selectedType: String
    @Binding var tabPoints: [CGFloat]
    @Binding var selectedScreen: Screen
    var body: some View{
        
      
        
        //Animations , Curves...
        GeometryReader{reader -> AnyView in
            
            //extracting Midpoint
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                
                if tabPoints.count <= 2{
                    tabPoints.append(midX)
                }
            }
            
            return AnyView(
                
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                        selectedType = image
                        if image == "video"{
                            selectedScreen = .scrvideo
                        }else if image == "book"{
                            selectedScreen = .scrbook
                        }else{
                            selectedScreen = .scrhome
                        }
                    }
                }, label: {
                    //filling the Color if ts selected
                    Image(systemName: "\(image)\(selectedType == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.black)
                    //Lifting if Selected
                        .offset(y: selectedType == image ? -10 : 0)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            )
        }
        .frame(height: 50)
    }
}


enum Screen: String {
    case scrvideo
    case scrbook
    case scrhome

}
