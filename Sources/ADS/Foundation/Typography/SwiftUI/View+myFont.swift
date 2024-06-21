import SwiftUI

public extension View {
    func alimoFont(_ alimoFont: AlimoFont) -> some View {
        self.font(alimoFont.font)
    }
}
