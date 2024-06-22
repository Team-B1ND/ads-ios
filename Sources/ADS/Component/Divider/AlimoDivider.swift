import SwiftUI

public enum DividerType {
    case thin
    case thick
    
    var height: CGFloat {
        switch self {
        case .thin: 1
        case .thick: 8
        }
    }
}

public struct AlimoDivider: View {
    
    private let type: DividerType
    private let color: SementicColor
    
    public init(
        type: DividerType = .thin,
        color: SementicColor = AlimoColor.Label.back
    ) {
        self.type = type
        self.color = color
    }
    
    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: type.height)
            .alimoColor(color)
    }
}

#Preview {
    VStack {
        AlimoDivider()
        AlimoDivider(type: .thick)
    }
    .preview()
}

#Preview("AlimoDividerDark") {
    VStack {
        AlimoDivider()
        AlimoDivider(type: .thick)
    }
    .preview(isDarkTheme: true)
}
