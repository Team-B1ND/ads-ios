import SwiftUI

public enum ListItemType {
    case content
    case description(_ description: String)
    case icon(_ icon: AlimoIconography)
}
