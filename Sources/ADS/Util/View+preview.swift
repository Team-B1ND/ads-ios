import SwiftUI

extension View {
    func preview(
        isDarkTheme: Bool = false,
        addPadding: Bool = true,
        background: SementicColor = AlimoColor.Background.normal
    ) -> some View {
        self
            .if(addPadding) { view in
                view.toCenter()
            }
            .registerPretendard()
            .alimoBackground(background)
            .environmentObject(ColorProvider(isDarkTheme: isDarkTheme))
    }
}
