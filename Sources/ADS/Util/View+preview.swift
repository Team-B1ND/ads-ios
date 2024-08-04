import SwiftUI

extension View {
    func preview(
        isDarkTheme: Bool = false,
        background: SementicColor = AlimoColor.Background.normal
    ) -> some View {
        self
            .registerPretendard()
            .alimoBackground(background)
            .environmentObject(ColorProvider(isDarkTheme: isDarkTheme))
    }
}
