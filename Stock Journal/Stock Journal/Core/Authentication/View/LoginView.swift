//
//  LoginView.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 07. 28..
//

import SwiftUI



struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                //Background Color
                Color(.white).ignoresSafeArea()
                VStack{
                    //Title
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical,32)
                    
                    VStack(spacing: 24){
                        //Email
                        InputView(text: $email,
                                  title: "Email Adress",
                                  placeholder: "Your email adress")
                            .autocapitalization(.none)
                        //Password
                        
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter your password",
                                  isSecureField: true)
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    //sign in button
                    
                    Button{
                        
                        Task{
                            try await viewModel.signIn(withEmail: email, password: password)
                        }
                        
                    } label: {
                        HStack{
                            Text("SIGN IN")
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
                
                    
                    //other options
                    Text("or sign in with these options email adres")
                        .foregroundColor(Color.black.opacity(0.4))
                    
                    SocialLoginButton(image: Image("apple"), text:Text("Sign in with Apple"))
                    
                    SocialLoginButton(image: Image("google"), text:Text("Sign in with Google")).foregroundColor(Color("PrimaryColor"))
                        .padding(.vertical)
                    
                    
                }
                .padding()
            }
        }
    }
}
// MARK - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var fromIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SocialLoginButton: View {
    var image: Image
    var text: Text
    var body: some View {
        HStack{
            image
                .padding(.horizontal)
            Spacer()
            text
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0, y: 16)
    }
}
