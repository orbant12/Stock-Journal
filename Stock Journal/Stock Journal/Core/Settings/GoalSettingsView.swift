//
//  GoalSettingsView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 06. 04..
//

import SwiftUI

struct GoalSettingsView: View {
    
    @State var FirstGoal: String = ""
    @State var SecoundGoal: String = ""
    @State var ThirdGoal: String = ""
    @State var ModeSelect: String = ""
    
    var body: some View {
        NavigationView{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing).ignoresSafeArea()
            VStack{
                Spacer().frame(width: 10,height: 10)
                Text("What are your Goals ?").font(.title).fontWeight(.bold).frame(width: 350,height: 100).background(Color(.orange)).cornerRadius(10)
                Text("Type in your Current Goals and")
                Text("Select a Priority Label")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                Spacer().frame(width: 40, height: 10)
                VStack{
                    Spacer().frame(width: 10,height: 40)
                    HStack{
                        TextField(" Type in your goal ", text: $FirstGoal).frame(width: 250,height: 50).background(Color(.white)).cornerRadius(10)
                        Spacer().frame(width: 40, height: 10)
                        Text("Save").frame(width: 50,height: 50).background(Color(.red)).cornerRadius(10)
                    }
                    Spacer().frame(width: 40, height: 80)
                    Divider()
                    VStack{
                        HStack{
                            Text("Added Goals")
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(width:200,height: 60).cornerRadius(10)
                            Spacer()
                        }
                        
                        HStack{
                            Text(FirstGoal).frame(width: 150,height: 50).background(Color(.white)).cornerRadius(10)
        
                            Image(systemName: "trash.square").resizable().frame(width: 30, height: 30).foregroundColor(.red)
                            Spacer().frame(width: 150, height: 10)
                            
                            
                        }
                        HStack{
                            Text(FirstGoal).frame(width: 150,height: 50).background(Color(.white)).cornerRadius(10)
                            Image(systemName: "trash.square").resizable().frame(width: 30, height: 30).foregroundColor(.red)
                            Spacer().frame(width: 150, height: 10)
                            
                        }
                        HStack{
                            Text(FirstGoal).frame(width: 150,height: 50).background(Color(.white)).cornerRadius(10)
                            Image(systemName: "trash.square").resizable().frame(width: 30, height: 30).foregroundColor(.red)
                            Spacer().frame(width: 150, height: 10)}
                        
                        
                    }
                    
                    VStack{
                        Spacer().frame(width: 10,height: 150)
                        NavigationLink(destination:  ModeSelectView(), label:{
                            Text("Save").frame(width: 100,height: 50).background(Color(.systemCyan)).cornerRadius(10)
                                        })
                    }
                    
                    
                }
            }
            }
        }
    }
}
struct ModeSelectView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white, .orange]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing).ignoresSafeArea()
                VStack{
                    
                    Divider().frame(width: 350,height: 40)
                    Text("Select Priority Mode").font(.title).fontWeight(.bold).frame(width: 300,height: 100).background(Color(.orange)).cornerRadius(10)
                    Spacer().frame(width: 10,height: 100)
                    HStack{
                        Text("Goal")
                        Spacer().frame(width: 100,height: 10)
                        Text("Normal")
                        Text("MunkMode")
                        
                    }
                    Spacer().frame(width: 100,height: 100)
                    HStack{
                        Text("Goal")
                        Spacer().frame(width: 100,height: 10)
                        Text("Normal")
                        Text("MunkMode")
                        
                    }
                    Spacer().frame(width: 100,height: 100)
                    HStack{
                        Text("Goal")
                        Spacer().frame(width: 100,height: 10)
                        
                    }
                    Spacer()
                }
            }
        }
    }
}
         

struct GoalSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSettingsView()
    }
}
