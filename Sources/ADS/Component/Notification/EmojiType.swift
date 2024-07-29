//
//  File.swift
//  
//
//  Created by dgsw8th61 on 7/29/24.
//

import Foundation
import SwiftUI

public enum EmojiType: String, CaseIterable {
    case okay = "OKAY"
    case love = "LOVE"
    case laugh = "LAUGH"
    case sad = "SAD"
    case angry = "ANGRY"

    static func fromString(_ str: String?) -> EmojiType? {
        return str.flatMap { EmojiType(rawValue: $0) }
    }

    var image: Image {
        switch self {
        case .okay: return Image(.ok)
        case .love: return Image(.heart)
        case .laugh: return Image(.funny)
        case .sad: return Image(.sad)
        case .angry: return Image(.angry)
        }
    }
}
