//
//  SplashViewModel.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-10.
//

import SwiftUI

class SplishViewModel: ObservableObject {
    
    @Published var shouldShowMainTabView: Bool = false
    
    func showLoginView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.shouldShowMainTabView = true
            }
        }
    }
    
}
