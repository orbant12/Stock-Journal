//
//  UserYetView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 07. 31..
//

import SwiftUI

struct UserYetView: View {
    
    @State private var orderProvide = false
    @State private var subProvider = false
    @State private var btnsProvider = false
    

    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Hey There !")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.trailing,140)
                    .padding(.top,40)
                    .animation(.easeInOut(duration: 1.0))
                    .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                                self.orderProvide = true
                            }
                    }
                if orderProvide { 
                    Text("My name is Echo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.trailing,60)
                        .padding(.top, 1)
                        .transition(.slide)
                        .animation(.easeInOut(duration: 1.0))
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                                self.subProvider = true
                            }
                        }
                }
                    
                if subProvider {
                    Image("1")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .cornerRadius(30)
                    .background(.white)
                    .cornerRadius(10)
                    .zIndex(-1)
                    .padding()
                
                
                    Text("Do we know each other ?")
                        .font(.title)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 1.0))
                        .onAppear{
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                                self.btnsProvider = true
                            }
                        }
                }
              
                
                Spacer().frame(height: 100)
                if btnsProvider {
                    
                    VStack{
                        NavigationLink(destination: LoginView(), label: {
                            Text("Login")
                                .padding(16)
                                .frame(maxWidth: .infinity)
                                .background(Color(.black))
                                .cornerRadius(16)
                                .padding(.horizontal,32)
                                .foregroundColor(.white)
                            
                        })
                        
                        NavigationLink(destination: RegisterView(), label: {
                            Text("Hello Echo, I'm New !")
                                .padding(16)
                                .frame(maxWidth: .infinity)
                                .background(Color(.black))
                                .cornerRadius(16)
                                .padding(.horizontal,32)
                                .foregroundColor(.white)
                            
                        })
                    }.animation(.easeInOut(duration: 1.0))
                    }
                }
                
                
                
            }
        }
    }


struct UserYetView_Previews: PreviewProvider {
    static var previews: some View {
        UserYetView()
    }
}
