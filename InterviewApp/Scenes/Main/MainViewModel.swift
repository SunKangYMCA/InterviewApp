//
//  MainViewModel.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-14.
//

import SwiftUI
import AVFoundation

class MainViewModel: ObservableObject {
    
    @Published var questions: [Question] = [
        Question(title: "Tell me about yourself.", key: "audio1"),
        Question(title: "How would you describe yourself?", key: "audio2"),
        Question(title: "What makes you unique?", key: "audio3"),
        Question(title: "What do you want to work here?", key: "audio4"),
        Question(title: "What interests you about this role?", key: "audio5"),
        Question(title: "What motivates you?", key: "audio6"),
        Question(title: "What are you passionate about?", key: "audio7"),
        Question(title: "Why are you leaving your current job?", key: "audio8")
    ]
    
    var player: AVAudioPlayer!
    
    func playSound(key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "mp3")
        
        guard url != nil else {
            print("Url is nil")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}
