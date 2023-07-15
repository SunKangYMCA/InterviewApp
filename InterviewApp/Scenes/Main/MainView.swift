//
//  MainView.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-12.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.questions, id: \.id) { unit in
                HStack {
                    
                    Text("- \(unit.title)")
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            viewModel.playSound(key: unit.key)
                        }
                    } label: {
                            Image(systemName: "play.circle.fill")
                                .padding(5)
                                .background(
                                    Color.blue
                                        .opacity(0.3)
                                        .cornerRadius(.cornerRadius)
                                )
                    }
                }
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
