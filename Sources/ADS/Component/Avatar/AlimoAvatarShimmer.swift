import SwiftUI

public struct AlimoAvatarShimmer: View {
    
    private let type: AvatarType
    
    public init(
        type: AvatarType
    ) {
        self.type = type
    }
    
    public var body: some View {
        Circle()
            .frame(size: type.size)
            .shimmer()
    }
}

#Preview {
    VStack {
        ForEach(AvatarType.allCases, id: \.self) {
            AlimoAvatarShimmer(type: $0)
        }
    }
    .environmentObject(ColorProvider(isDarkTheme: false))
}
