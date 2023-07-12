//
//  MainTabView.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-12.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("home", systemImage: "house")
                }
            NoteView()
                .tabItem {
                    Label("meno", systemImage: "note.text")
                }
            AddFileView()
                .tabItem {
                    Label("add file", systemImage: "folder.badge.plus")
                }
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
