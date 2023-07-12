//
//  LoginView.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-10.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    var isSignInButtonDisabled: Bool { [viewModel.username, viewModel.password].contains(where: \.isEmpty) }
    var body: some View {
        if !viewModel.authenticated {
            loginInfo
        } else {
            VStack {
                
                title
                imageView
                loginTextField
                signInButton
                Spacer()
                signUpButton
                    .alert("Access denied", isPresented: $viewModel.invalid) {
                        Button("Dismiss", action: viewModel.logPressed)
                    }
            }
            .background(
                LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
            .transition(.offset(x: 0, y: 850))
        }
    }
    
    private var loginInfo: some View {
        VStack(spacing: 20) {
            Text("Welcome back **\(viewModel.username.lowercased())**!")
            
            Text("Today is: **\(Date().formatted(.dateTime))**")
            
            Button("Log out", action: viewModel.logOut)
                .tint(.red)
                .buttonStyle(.bordered)
         
            Button {
                print("do TabView")
            } label: {
                Text("Continue")
                    .font(.skFont(type: .largeBold))
                    .padding()
                    .background(
                        Color.blue
                            .opacity(0.5)
                            .cornerRadius(.cornerRadius)
                    )
            }
        }
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
            
            TextField("Name", text: $viewModel.username, prompt: Text("Name is \" sunkang\""))
                .padding()
                .background(
                    Color.white
                        .opacity(0.8)
                        .cornerRadius(.cornerRadius)
                )
                .textInputAutocapitalization(.never)
            
            HStack {
                Group {
                    if viewModel.showPassword {
                        TextField("Password", text: $viewModel.password, prompt: Text("Password is \"password\""))
                    } else {
                        SecureField("Password", text: $viewModel.password, prompt: Text("password"))
                    }
                }
                .padding()
                .background(
                    Color.white
                        .opacity(0.8)
                        .cornerRadius(.cornerRadius)
                )
                .textInputAutocapitalization(.never)
                
                
                Button {
                    viewModel.showPassword.toggle()
                } label: {
                    Image(systemName: viewModel.showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, 30)
        .alert("Access denied", isPresented: $viewModel.invalid) {
            Button("Dismiss", action: viewModel.logPressed)
        }
    }
    
    
    private var signInButton: some View {
        
        Button {
            viewModel.authenticate()
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
        
        VStack {
            Button {
                viewModel.showingPassword = true
            } label: {
                Text("Forgot password? **Click Here**")
                    .foregroundColor(.black)
            }
        }
        .alert("Password is \"password\"", isPresented: $viewModel.showingPassword) {
            Button("OK", role: .cancel) {}
        }
    }
    
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
