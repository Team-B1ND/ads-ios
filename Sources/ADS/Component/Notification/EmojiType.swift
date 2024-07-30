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

    public static func fromString(_ str: String?) -> EmojiType? {
        return str.flatMap { EmojiType(rawValue: $0) }
    }

    public var image: Image {
        switch self {
        case .okay: return Image(icon: .Ok)
        case .love: return Image(icon: .Heart)
        case .laugh: return Image(icon: .Funny)
        case .sad: return Image(icon: .Sad)
        case .angry: return Image(icon: .Angry)
        }
    }
}
