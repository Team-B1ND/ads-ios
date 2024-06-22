#if os(iOS)
import UIKit

public extension UIFont {
    static func pretendard(_ weight: Pretendard.Weight, size: CGFloat) -> UIFont {
        UIFont(name: "PretendardSans-\(weight.rawValue)", size: size) ?? .systemFont(ofSize: size, weight: weight.weight)
    }
}

public extension AlimoFont {
    var uiFont: UIFont {
        switch self {
        case .title1B: .pretendard(.Bold, size: 28)
        case .title1M: .pretendard(.Medium, size: 28)
        case .title1R: .pretendard(.Regular, size: 28)
        case .title2B: .pretendard(.Bold, size: 24)
        case .title2M: .pretendard(.Medium, size: 24)
        case .title2R: .pretendard(.Regular, size: 24)
        case .headline1B: .pretendard(.Bold, size: 20)
        case .headline1M: .pretendard(.Medium, size: 20)
        case .headline1R: .pretendard(.Regular, size: 20)
        case .headline2B: .pretendard(.Bold, size: 18)
        case .headline2M: .pretendard(.Medium, size: 18)
        case .headline2R: .pretendard(.Regular, size: 18)
        case .bodyB: .pretendard(.Bold, size: 16)
        case .bodyM: .pretendard(.Medium, size: 16)
        case .bodyR: .pretendard(.Regular, size: 16)
        case .labelB: .pretendard(.Bold, size: 14)
        case .labelM: .pretendard(.Medium, size: 14)
        case .labelR: .pretendard(.Regular, size: 14)
        case .captionB: .pretendard(.Bold, size: 12)
        case .captionM: .pretendard(.Medium, size: 12)
        case .captionR: .pretendard(.Regular, size: 12)
        }
    }
}

#endif
