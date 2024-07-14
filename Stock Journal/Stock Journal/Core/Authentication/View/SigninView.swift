//
//  SigninView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 07. 28..
//

import SwiftUI
import Combine

struct SigninView: View {
    @State var email: String = ""
    @State var fullname: String = ""
    
    @State private var password: String = ""
    
    @State private var confirmPassword:String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(.white).ignoresSafeArea()
                VStack{
                    VStack{
                        //Title
                        Text("Register")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical,32)
                        
                        VStack(spacing: 24){
                            
                            //Email
                           // InputView(text: $email, title: "Email Adress", placeholder: "Your email adress")
                                //.autocapitalization(.none)
                           
                            //Name
                            //InputView(text: $fullname ,title: "Name", placeholder: "Enter your username")
                            
                            //Password
                            InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                            
                            ZStack(alignment: .trailing){
                                //Confirm Password
                                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                                
                                if !password.isEmpty && !confirmPassword.isEmpty {
                                    if password == confirmPassword {
                                        Image(systemName: "checkmark.circle.fill")
                                            .imageScale(.large)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(.systemGreen))
                                    }else{
                                        Image(systemName: "xmark.circle.fill")
                                            .imageScale(.large)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(.systemRed))
                                    }
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)
                        
                        //Register Button
                        
                        Button{
                            Task {
                                try await viewModel.createUser(
                                    withEmail: email,
                                    password: password, fullname: fullname)
                            }
                        } label: {
                            HStack{
                                Text("SIGN UP")
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(Color(.systemBlue))
                        .disabled(!fromIsValid)
                        .opacity(fromIsValid ? 1.0 : 0.5)
                        .cornerRadius(30)
                        .padding(.top, 24)
                        
                        Spacer()
                        
                        
                        Text("or sign up with these options email adres")
                            .foregroundColor(Color.black.opacity(0.4))
                        
                        SocialLoginButton(image: Image("apple"), text:Text("Sign up with Apple"))
                        
                        SocialLoginButton(image: Image("google"), text:Text("Sign up with Google")).foregroundColor(Color("PrimaryColor"))
                            .padding(.vertical)
                        
                    }
                    .padding()
                }
            }
        }
    }
}

//MARK - AuthenticationFormProtocol
extension SigninView: AuthenticationFormProtocol {
    var fromIsValid: Bool {
        return //!email.isEmpty
       // && email.contains("@")
         !password.isEmpty
        && password.count > 5
        && confirmPassword == password
       // && !fullname.isEmpty
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}


