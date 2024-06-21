import SwiftUI

public extension BottomTabType {
    
    var image: AlimoIconography {
        switch self {
        case .Home: .Home
        case .Bookmark: .Bookmark
        case .Profile: .Person
        }
    }
    
    var label: String {
        switch self {
        case .Home: "홈"
        case .Bookmark: "북마크"
        case .Profile: "프로필"
        }
    }
}
