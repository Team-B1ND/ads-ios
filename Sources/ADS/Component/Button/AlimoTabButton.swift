import SwiftUI

public struct AlimoTabButton: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    
    // MARK: - Parameters
    private let text: String
    private let leadingIcon: AlimoIconography?
    private let trailingIcon: AlimoIconography?
    private let isSelected: Bool
    private let action: () async -> Void
    
    public init(
        _ text: String,
        leadingIcon: AlimoIconography? = nil,
        trailingIcon: AlimoIconography? = nil,
        isSelected: Bool,
        action: @escaping () async -> Void
    ) {
        self.text = text
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        
        let color: SementicColor = isSelected ? AlimoColor.Color.neutralPrimary : AlimoColor.Label.alt
        
        Button {
            Task {
                await action()
            }
        } label: {
            HStack(spacing: 3) {
                if let leadingIcon {
                    Image(icon: leadingIcon)
                        .resizable()
                        .alimoIconColor(color)
                        .frame(size: 20)
                }
                Text(text)
                    .alimoColor(color)
                    .alimoFont(.bodyM)
                if let trailingIcon {
                    Image(icon: trailingIcon)
                        .resizable()
                        .alimoIconColor(color)
                        .frame(size: 20)
                }
            }
            .padding(.horizontal, 12)
        }
        .frame(height: 37)
        .overlay {
            Rectangle()
                .frame(height: 1)
                .alimoColor(color)
                .opacity(isSelected ? 1 : 0)
                .frame(maxWidth: .infinity)
                .toBottom()
        }
    }
}
