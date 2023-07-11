//
//  SplashView.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-10.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var viewModel = SplishViewModel()
    
    var body: some View {
        ZStack(alignment: .center) {
            if viewModel.shouldShowMainTabView {
                LoginView()
            } else {
                Rectangle()
                    .foregroundColor(.red)
                    .opacity(0.5)
                    .ignoresSafeArea()
                VStack {
                    
                    Text("Interview\nApp")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.skFont(type: .largeBold))
                        .shadow(radius: 5)
                        .padding()
                        .background(
                            Color.green
                                .opacity(0.6)
                                .cornerRadius(.cornerRadius)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius:.cornerRadius)
                                .stroke(.white, lineWidth: 5)
                        }
                    
                        .padding()
                    
                    HStack {
                        Image(systemName: "ear")
                            .resizable()
                            .foregroundColor(.yellow)
                            .scaledToFit()
                            .frame(width: 50)
                        Image(systemName: "mouth")
                            .resizable()
                            .foregroundColor(.brown)
                            .scaledToFit()
                            .frame(width: 70)
                        Image(systemName: "ear")
                            .resizable()
                            .foregroundColor(.blue)
                            .scaledToFit()
                            .frame(width: 50)
                        Image(systemName: "mouth")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 70)
                    }
                }
            }
        }
                .onAppear {
                    viewModel.showLoginView()
                }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
