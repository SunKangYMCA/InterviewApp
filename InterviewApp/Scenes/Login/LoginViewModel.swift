//
//  LoginViewModel.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-11.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @AppStorage("AUTH_KEY") var authenticated = false {
        willSet { objectWillChange.send() }
    }
    @AppStorage("USER_KEY") var username = "sunkang"
    @Published var password = "password"
    @Published var invalid: Bool = false
    @Published var showingPassword: Bool = false
    @Published var showPassword: Bool = false
    
    private var sampleUser = "sunkang"
    private var samplePassword = "password"
    
    init() {
        print("Currently logged on: \(authenticated)")
        print("Current user: \(username)")
        self.username = ""
        self.password = ""
    }
    
    func toggleAuthentication() {
        self.password = ""
        
        withAnimation {
            authenticated.toggle()
        }
    }
    
    func authenticate() {
        guard self.username.lowercased() == sampleUser else {
            self.invalid = true
            return
        }
        
        guard self.password.lowercased() == samplePassword else {
            self.invalid = true
            return
        }
        
        toggleAuthentication()
    }
    
    func logOut() {
        toggleAuthentication()
    }
    
    func logPressed() {
        print("Button pressed.")
    }
}

