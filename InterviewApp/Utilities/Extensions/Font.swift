//
//  Font.swift
//  InterviewApp
//
//  Created by 강성찬 on 2023-07-10.
//

import SwiftUI

extension Font {
    enum SKFontType {
        case tiny, smell, normal, large, huge
        case tinyBold, smellBold, normalBold, largeBold, hugeBold
        
        var size: CGFloat {
            switch self {
            case .tiny, .tinyBold:
                return 8
            case .smell, .smellBold:
                return 16
            case .normal, .normalBold:
                return 24
            case .large, .largeBold:
                return 48
            case .huge, .hugeBold:
                return 64
            }
        }
        
        var weight: Weight {
            switch self {
            case .tiny, .smell, .normal, .large, .huge:
                return .regular
            case .tinyBold, .smellBold, .normalBold, .largeBold, .hugeBold:
                return .bold
            }
        }
    }
    
    static func skFont(type: Font.SKFontType = .normal) -> Font {
        .system(size: type.size, weight: type.weight)
    }
}
