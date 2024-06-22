import SwiftUI
import NukeUI

public enum AvatarType: CaseIterable {
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case xxl
    
    var size: CGFloat {
        switch self {
        case .extraSmall: 16
        case .small: 24
        case .medium: 32
        case .large: 36
        case .extraLarge: 64
        case .xxl: 128
        }
    }
}

public struct AlimoAvatar: View {
    
    private let url: String?
    private let type: AvatarType
    
    public init(
        _ url: String? = nil,
        type: AvatarType
    ) {
        self.url = url
        self.type = type
    }
    
    public var body: some View {
        if let url {
            LazyImage(url: .init(string: url)) { state in
                if let image = state.image {
                    image
                } else if state.error != nil {
                    label
                } else {
                    AlimoAvatarShimmer(type: type)
                }
            }
            .processors([.resize(size: .init(width: type.size, height: type.size), unit: .pixels)])
            .clipShape(Circle())
        } else {
            label
        }
    }
    
    @ViewBuilder
    private var label: some View {
        Circle()
            .alimoColor(AlimoColor.Label.back)
            .frame(width: type.size, height: type.size)
            .overlay {
                Image(icon: .Person)
                    .resizable()
                    .alimoIconColor(AlimoColor.Label.alt)
                    .frame(width: type.size * 5 / 8, height: type.size * 5 / 8)
            }
    }
}

#Preview {
    VStack {
        ForEach(AvatarType.allCases, id: \.self) {
            AlimoAvatar(type: $0)
        }
    }
    .environmentObject(ColorProvider(isDarkTheme: false))
}


#Preview("AlimoAvatarDark") {
    VStack {
        ForEach(AvatarType.allCases, id: \.self) {
            AlimoAvatar(type: $0)
        }
    }
    .alimoBackground(AlimoColor.Background.normal)
    .environmentObject(ColorProvider(isDarkTheme: true))
}
