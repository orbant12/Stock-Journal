//
//  RegisterView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 13..
//

import SwiftUI

//First_____

struct RegisterView: View {
    
    @State private var shouldChange = false
    @State var buttonTitle = "Name"
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Nice to meet you aah..")
                    .font(.title)
                    .fontWeight(.bold)
                    .animation(.easeInOut(duration: 1.0))
                    .onAppear{
                        self.shouldChange = true
                    }
                if shouldChange == true{
                    Text("What's Your Name ?")
                        .foregroundColor(.black)
                        .font(.title)
                        .transition(.slide)
                }
                
            }
            Image("1")
            NavigationLink(destination: RegisterSecView(email: .constant(""), fullname: .constant("")), label: {
                Text("More")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(30)
                    .shadow(color: Color.green.opacity(0.3), radius: 10,x: 0.0,y: 10)
            }).padding(40).padding(.top,600)
        }
    }
}
    
    
    
    
    // Secund______
    
    
struct RegisterSecView: View{
    
    @Binding var email: String
    @Binding var fullname: String
    @State var buttonTitle = "Save"
    
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color("BgColor2").ignoresSafeArea()
                VStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 350,height: 500)
                        .cornerRadius(30)
                    // Into The Rectangle
                        .overlay(
                            
                            VStack{
                                //Email
                                TextField("email", text: $email)
                                    .font(.system(size: 14))
                                    .autocapitalization(.none)
                                //Name
                                TextField("name", text: $fullname)
                                    .font(.system(size: 14))
                                
                            }
                        )
                    // Middle Text Section
                    Text("What's your name ?")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top,40)
                    
                    Spacer().padding()
                    NavigationLink(destination: RegisterThirdView(), label: {
                        Text("More")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(30)
                            .shadow(color: Color.green.opacity(0.3), radius: 10,x: 0.0,y: 10)
                        
                    })
                }
            }
        }
    }
    
    /*extension RegisterSecView: AuthenticationFormProtocol {
     var fromIsValid: Bool {
     return !email.isEmpty
     && email.contains("@")
     && !fullname.isEmpty
     }
     }*/
    
    
    //THird _____
    
    struct RegisterThirdView: View{
        
        var body: some View {
            NavigationView{
                VStack{
                    NavigationLink(destination: RegisterFourthView(), label: {
                        Text("More")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(30)
                            .shadow(color: Color.green.opacity(0.3), radius: 10,x: 0.0,y: 10)
                        
                    }).padding(40).padding(.top,600)
                }
            }
        }
    }
    
    
    //Fourth_______
    
    struct RegisterFourthView: View{
        var body: some View{
            NavigationView{
                VStack{
                    Text("Select")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 50)
                    
                    
                    NavigationLink(destination: ytTutorial(), label: {
                        Rectangle()
                            .background(Color(.black))
                            .frame(width: 300, height: 100)
                            .overlay(
                                Text("Video / YouTube")
                            )
                    }).padding(30).padding(.top,50)
                    
                    NavigationLink(destination: audioTutorial(), label: {
                        Rectangle()
                            .background(Color(.black))
                            .frame(width: 300, height: 100)
                            .overlay(
                                Text("Audio / Spotify")
                            )
                    }).padding(30)
                    
                    NavigationLink(destination: bookTutorial(), label: {
                        Rectangle()
                            .background(Color(.black))
                            .frame(width: 300, height: 100)
                            .overlay(
                                Text("Books")
                            )
                    }).padding(30)
                    Spacer()
                }
            }
        }
    }
    
    
    
    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterThirdView()
        }
    }
    
    
    
}
