import SwiftUI

public struct AlimoButton: View {
    
    // MARK: - State
    @State private var isLoading = false
    @EnvironmentObject private var colorProvider: ColorProvider
    
    // MARK: - Parameters
    private let text: String
    private let type: ButtonType
    private let leadingIcon: AlimoIconography?
    private let trailingIcon: AlimoIconography?
    private let isEnabled: Bool
    private let isRounded: Bool
    private let action: () async -> Void
    
    public init(
        _ text: String,
        type: ButtonType,
        leadingIcon: AlimoIconography? = nil,
        trailingIcon: AlimoIconography? = nil,
        isEnabled: Bool = true,
        isRounded: Bool = false,
        action: @escaping () async -> Void
    ) {
        self.text = text
        self.type = type
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isEnabled = isEnabled
        self.isRounded = isRounded
        self.action = action
    }
    
    public var body: some View {
        let labelColor: SementicColor = isEnabled ? AlimoColor.Color.neutral90 : AlimoColor.Background.sub
        Button {
            guard isEnabled, !isLoading else { return }
            isLoading = true
            Task {
                await action()
                isLoading = false
            }
        } label: {
            HStack(spacing: type.labelSpacing) {
                if let leadingIcon {
                    Image(icon: leadingIcon)
                        .resizable()
                        .alimoIconColor(labelColor)
                        .frame(size: 20)
                }
                Text(text)
                    .alimoColor(labelColor)
                    .alimoFont(type.font)
                if let trailingIcon {
                    Image(icon: trailingIcon)
                        .resizable()
                        .alimoIconColor(labelColor)
                        .frame(size: 20)
                }
            }
            .opacity(isLoading ? 0 : 1)
            .padding(.horizontal, type.horizontalPadding)
            .overlay {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: colorProvider.color(labelColor)))
                }
            }
        }
        .buttonStyle(AlimoButtonStyle(isLoading: isLoading, isEnabled: isEnabled, isRounded: isRounded, type: type))
        .disabled(isLoading)
    }
}

struct AlimoButtonStyle: ButtonStyle {
    private let isLoading: Bool
    private let isEnabled: Bool
    private let isRounded: Bool
    private let type: ButtonType
    
    init(
        isLoading: Bool,
        isEnabled: Bool,
        isRounded: Bool,
        type: ButtonType
    ) {
        self.isLoading = isLoading
        self.isEnabled = isEnabled
        self.isRounded = isRounded
        self.type = type
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        let background: SementicColor = isEnabled ? AlimoColor.Color.primary60 : AlimoColor.Background.sub
        
        configuration.label
            .frame(height: type.height)
            .if(type == .CTA) {
                $0.frame(maxWidth: .infinity)
            }
            .alimoBackground(background)
            .cornerRadius(isRounded ? type.height / 2 : type.cornerRadius, corners: .allCorners)
            .if(isEnabled) {
                $0.addPressAnimation(configuration.isPressed)
            }
    }
}

#Preview {
    VStack {
        AlimoButton("시작하기", type: .CTA) {}
        Text("Hello")
    }
    .registerPretendard()
    .environmentObject(ColorProvider(isDarkTheme: false))
}
