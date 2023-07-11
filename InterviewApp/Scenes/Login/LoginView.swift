//
//  LoginView.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-10.
//

import SwiftUI

struct LoginView: View {
    
    var isSignInButtonDisabled: Bool { [name, password].contains(where: \.isEmpty) }
    
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var body: some View {
        VStack {
            
            title
            imageView
            loginTextField
            signInButton
            Spacer()
            signUpButton
            
            
        }
        .background(
            LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    private var title: some View {
        Text("Welcome Interview App")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding([.top, .bottom], 40)
    }
    
    private var imageView: some View {
        Image(systemName: "person.circle")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.green, lineWidth: 10)
            }
            .shadow(radius: 10)
            .padding(.bottom, 50)
    }
    
    private var loginTextField: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            TextField("Name", text: $name, prompt: Text("Name"))
                .padding()
                .background(
                    Color.white
                        .opacity(0.8)
                        .cornerRadius(.cornerRadius)
                )
            
            HStack {
                Group {
                    if showPassword {
                        TextField("Password", text: $password, prompt: Text("Password"))
                    } else {
                        SecureField("Password", text: $password, prompt: Text("Password"))
                    }
                }
                .padding()
                .background(
                    Color.white
                        .opacity(0.8)
                        .cornerRadius(.cornerRadius)
                )
                
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, 30)
        
    }


    private var signInButton: some View {
        
        Button {
            print("do login action")
        } label: {
            Text("Sing In")
                .font(.skFont(type: .normalBold))
                .foregroundColor(.white)
                
        }
        .frame(width: 250, height: 50)
        .background(
            isSignInButtonDisabled ? LinearGradient(colors: [.green], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.green, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(.cornerRadius)
        .disabled(isSignInButtonDisabled)
        .padding(.top, 50)
    }
    
    private var signUpButton: some View {
        
        Button {
            print("do sign up action")
        } label: {
            Text("Don't have an account? **Sign up**")
                .foregroundColor(.black)
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
