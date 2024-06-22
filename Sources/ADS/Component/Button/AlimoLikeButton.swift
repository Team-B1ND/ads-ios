import SwiftUI

public struct AlimoLikeButton: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    
    // MARK: - Parameters
    private let like: Int
    private let isLiked: Bool
    private let action: () async -> Void
    
    public init(
        like: Int,
        isLiked: Bool,
        action: @escaping () async -> Void
    ) {
        self.like = like
        self.isLiked = isLiked
        self.action = action
    }
    
    public var body: some View {
        
        let labelColor: SementicColor = isLiked ? AlimoColor.Warning.normal : AlimoColor.Label.em
        let background: SementicColor = isLiked ? AlimoColor.Warning.back : AlimoColor.Label.back
        
        Button {
            Task {
                await action()
            }
        } label: {
            HStack(spacing: 4) {
                Image(icon: .HeartFill)
                    .resizable()
                    .alimoIconColor(labelColor)
                    .frame(size: 24)
                Text("\(like)")
                    .alimoColor(labelColor)
                    .alimoFont(.bodyB)
            }
            .padding(.horizontal, 6)
            .frame(height: 36)
            .alimoBackground(background)
            .cornerRadius(4, corners: .allCorners)
        }
    }
}

#Preview {
    VStack {
        AlimoLikeButton(like: 100, isLiked: true) {
            
        }
        AlimoLikeButton(like: 100, isLiked: false) {
            
        }
    }
    .preview()
}


#Preview("AlimoLikeButtonDark") {
    VStack {
        AlimoLikeButton(like: 100, isLiked: true) {
            
        }
        AlimoLikeButton(like: 100, isLiked: false) {
            
        }
    }
    .preview(isDarkTheme: true)
}
