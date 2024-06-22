import SwiftUI

public struct AlimoCategory: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let text: String
    private let type: CategoryType
    
    public init(
        _ text: String,
        type: CategoryType
    ) {
        self.text = text
        self.type = type
    }
    
    private var textColor: SementicColor {
        switch type {
        case .enabled:
            AlimoColor.Color.neutral90
        case .disabled:
            AlimoColor.Label.em
        case .selected:
            AlimoColor.Label.normal
        }
    }
    
    private var backgroundColor: SementicColor {
        switch type {
        case .enabled:
            AlimoColor.Color.primary60
        case .disabled:
            AlimoColor.Background.sub
        case .selected:
            AlimoColor.Color.transparent
        }
    }
    
    public var body: some View {
        Text(text)
            .padding(.horizontal, 16)
            .frame(height: 30)
            .alimoFont(.labelM)
            .alimoBackground(backgroundColor)
            .alimoColor(textColor)
            .cornerRadius(15, corners: .allCorners)
            .if(type == .selected) { view in
                view.stroke(15, content: colorProvider.color(AlimoColor.Color.primary60), lineWidth: 1.5)
            }
    }
}

#Preview {
    VStack {
        ForEach(CategoryType.allCases, id: \.self) {
            AlimoCategory("B1ND", type: $0)
                .button {
                    
                }
        }
    }
    .preview()
}

#Preview("AlimoCategoryDark") {
    VStack {
        ForEach(CategoryType.allCases, id: \.self) {
            AlimoCategory("B1ND", type: $0)
                .button {
                    
                }
        }
    }
    .preview(isDarkTheme: true)
}
