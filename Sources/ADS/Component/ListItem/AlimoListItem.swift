import SwiftUI

public struct AlimoListItem<T>: View where T: View {
    
    private let text: String
    private let type: ListItemType
    private let content: () -> T
    
    public init(
        _ text: String,
        type: ListItemType,
        content: @escaping () -> T = { EmptyView() }
    ) {
        self.text = text
        self.type = type
        self.content = content
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .alimoFont(.bodyM)
                .alimoColor(AlimoColor.Label.normal)
            Spacer()
            switch type {
            case .content:
                content()
            case .description(let description):
                Text(description)
                    .alimoColor(AlimoColor.Label.alt)
                    .alimoFont(.bodyM)
            case .icon(let icon):
                Image(icon: icon)
                    .resizable()
                    .alimoIconColor(AlimoColor.Label.alt)
                    .frame(size: 24)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}

#Preview {
    VStack {
        AlimoListItem("알림 설정", type: .content) {
            AlimoToggle(isOn: .constant(true))
        }
        AlimoListItem("버전", type: .description("v1.0.0"))
        AlimoListItem("개인 정보 이용 약관", type: .icon(.ExpandRight))
    }
    .alimoBackground(AlimoColor.Background.alt)
    .registerPretendard()
    .environmentObject(ColorProvider(isDarkTheme: true))
}
