//
//  HomeView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 08. 01..
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                //BACKGROUND
                Color(.black)
                    .ignoresSafeArea()
                
                //FIRST BODY VERTICAL STACK
                VStack{
                    //FIRST ROW CALLENDAR
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.purple)
                        
                        Text("Tue.25 Jan 2025")
                            .foregroundColor(.purple)
                                
                        Spacer()
                        }.padding(.leading)
                    //SEC ROW ( HELLO USER AND BLOCK )
                    HStack{
                        //Text("Hello \(viewModel.currentUser?.fullname ?? "user")")
                        Text("Hello User !")
                            .padding()
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.title)
                        
                        Spacer()
                        
                        Button(
                            action:{ print("New Page") },
                            label:{ Image(systemName: "bell")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color(.gray))
                                    .cornerRadius(10)})
                            
                        }.padding(.bottom)
                        
                        //SCROLL VIEW BODY VERTICAL
                        ScrollView{
                            VStack{
                                // HELP US, FEEDBACK
                                HStack{
                                    
                                    Circle().frame(width: 120,height: 120).padding(5)
                                    
                                    VStack{
                                        Text("Help us improve").font(.title2)
                                            .fontWeight(.bold).padding(.vertical,2).padding(.trailing,50)
                                        Text("We want the best for you, by your feedback")
                                            .font(.subheadline).padding(.trailing,50)
                                    }
                                }
                                .background(Color(.white))
                                .cornerRadius(30)
                                .padding()
                                
                                //DIvider Line
                                Divider().overlay(.white).frame(width: 340).padding(.bottom,20)
                                
                                //RECENTLY ADDED Title
                                HStack{
                                    Text("Recently Added")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("My History").padding(.trailing,20).foregroundColor(.white)
                                }.padding(.leading)
                                
                                //Horizontal Stack RECENTLY ADDED
                                ScrollView(.horizontal){
                                    HStack{
                                        PodcastWidget().padding()
                                      
                                    }
                                }
                                
                                // DIVIDER LINE
                                Divider()
                                    .overlay(.white)
                                    .frame(width: 340)
                                    .padding()
                                
                                //YOUR MEMORY TITLE
                                HStack{
                                    Text("Your Memory")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Text("More")
                                        .padding(.trailing,20)
                                        .foregroundColor(Color(.white))
                                }.padding(.leading)
                                
                                //FOLDERS
                                List {
                                    HStack{
                                        Image(systemName: "briefcase.circle")
                                        VStack{
                                            Text("Finance")
                                            Text("3 Files")
                                        }
                                    }
                                }
                             
                                
                            }
                           
                        }
                      
                    }
                  
                }
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct PodcastWidget: View {
    var body: some View {
        NavigationLink(destination: MemoryView(), label: {
            
            VStack {
                Rectangle()
                    .frame(width: 150, height: 150)
                    .padding(.leading,10)
                .padding(.trailing, 10)
                
                Text("Andrew Huberman")
            }
        })
        
    }
}
