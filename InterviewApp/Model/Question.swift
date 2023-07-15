//
//  Question.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-14.
//

import Foundation

struct Question: Identifiable, Equatable {
    var id: UUID = UUID()
    var title: String
    var key: String
}
