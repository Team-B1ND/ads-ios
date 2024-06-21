import SwiftUI
import UIKit

public struct Pretendard {
    
    public enum Weight: String, CaseIterable {
        case Black
        case Bold
        case ExtraBold
        case ExtraLight
        case Light
        case Medium
        case Regular
        case SemiBold
        case Thin
        
        var weight: UIFont.Weight {
            switch self {
            case .Black: .black
            case .Bold: .bold
            case .ExtraBold: .bold
            case .ExtraLight: .light
            case .Light: .light
            case .Medium: .medium
            case .Regular: .regular
            case .SemiBold: .semibold
            case .Thin: .thin
            }
        }
    }
    
    public static func register() {
        Pretendard.Weight.allCases.forEach {
            guard let fontURL = Bundle.module.url(
                forResource: "Pretendard-\($0.rawValue)",
                withExtension: "otf"
            ),
                  let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
                  let font = CGFont(fontDataProvider) else { return }
            var error: Unmanaged<CFError>?
            CTFontManagerRegisterGraphicsFont(font, &error)
        }
    }
}
