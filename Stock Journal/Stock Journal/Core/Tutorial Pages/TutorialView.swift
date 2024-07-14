//
//  TutorialView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 05. 29..
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        NavigationView{
            
            VStack{

                Spacer().frame(width: 100,height: 50)
                HStack{
                    
                    Text("Tutorial Image")
                    
                }.frame(width: 350, height: 300).background(Color(.orange)).cornerRadius(20)
                Spacer().frame(width: 100,height: 100)
                VStack{
                    Text("Fill in your current personal Goals ")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Spacer().frame(width: 100,height: 10)
                    Text("( Optimally do not add more than 3 )")
                    Spacer().frame(width: 100,height: 70)
                    NavigationLink(destination: StepTwoView(), label:{
                        Text("Next Step")
                    })
                }
                Spacer()
            }.navigationTitle("Step 1")
                
        }.navigationBarBackButtonHidden(true)
    }
}

struct StepTwoView: View{
    var body: some View{
        VStack{

            Spacer().frame(width: 100,height: 50)
            HStack{
                
                Text("Tutorial Image")
                
            }.frame(width: 350, height: 300).background(Color(.orange)).cornerRadius(20)
            Spacer().frame(width: 100,height: 100)
            VStack{
                Text("At the Home page you see Today's activity")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer().frame(width: 100,height: 10)
                Text("( Optimally do not add more than 3 )")
                Spacer().frame(width: 100,height: 70)
                NavigationLink(destination: StepThreeView(), label:{
                    Text("Next Step")
                })
                
                
                
            }
            
            Spacer()
        }.navigationTitle("Step 2")
    }
}

struct StepThreeView: View{
    var body: some View{
        VStack{

            Spacer().frame(width: 100,height: 50)
            HStack{
                
                Text("Tutorial Image")
                
            }.frame(width: 350, height: 300).background(Color(.orange)).cornerRadius(20)
            Spacer().frame(width: 100,height: 100)
            VStack{
                Text("At the Home page you see Today's activity")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer().frame(width: 100,height: 10)
                Text("( Optimally do not add more than 3 )")
                Spacer().frame(width: 100,height: 70)
                NavigationLink(destination: StepFourView(), label:{
                    Text("Next Step")
                })
                
                
                
            }
            
            Spacer()
        }.navigationTitle("Step 3")
    }
}

struct StepFourView: View{
    var body: some View{
        VStack{

            Spacer().frame(width: 100,height: 50)
            HStack{
                
                Text("Tutorial Image")
                
            }.frame(width: 350, height: 300).background(Color(.orange)).cornerRadius(20)
            Spacer().frame(width: 100,height: 100)
            VStack{
                Text("At the Home page you see Today's activity")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer().frame(width: 100,height: 10)
                Text("( Optimally do not add more than 3 )")
                Spacer().frame(width: 100,height: 70)
                NavigationLink(destination: LoginView(), label:{
                    Text("I'm Ready")
                })
                
                
                
            }
            
            Spacer()
        }.navigationTitle("Step 4")
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
