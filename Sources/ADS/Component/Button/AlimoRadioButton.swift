import SwiftUI

public struct AlimoRadioButton: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let text: String
    private let selectedIcon: AlimoIconography
    private let unselectedIcon: AlimoIconography
    private let isSelected: Bool
    private let action: () -> Void
    
    public init(
        _ text: String,
        selectedIcon: AlimoIconography = .Radio,
        unselectedIcon: AlimoIconography = .RadioUnselected,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.selectedIcon = selectedIcon
        self.unselectedIcon = unselectedIcon
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        
        let primary: SementicColor = isSelected ? AlimoColor.Color.neutralPrimary : AlimoColor.Label.alt
        let secondary: SementicColor = isSelected ? AlimoColor.Label.normal : AlimoColor.Label.alt
        
        Button {
            action()
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        } label: {
            HStack(spacing: 6) {
                Image(icon: isSelected ? selectedIcon : unselectedIcon)
                    .resizable()
                    .alimoIconColor(primary)
                    .frame(size: 24)
                Text(text)
                    .alimoFont(.bodyM)
                    .alimoColor(secondary)
            }
            .padding(.horizontal, 14)
            .frame(height: 44)
            .stroke(12, content: colorProvider.color(primary), lineWidth: 1.5)
        }
        .applyAnimation()
    }
}

#Preview {
    VStack {
        AlimoRadioButton("Server", isSelected: true) {}
        AlimoRadioButton("Server", isSelected: false) {}
    }
    .preview()
}

#Preview("AlimoRadioButtonDark") {
    VStack {
        AlimoRadioButton("Server", isSelected: true) {}
        AlimoRadioButton("Server", isSelected: false) {}
    }
    .preview(isDarkTheme: true)
}

