import SwiftUI

public struct AlimoTextButton: View {
    
    // MARK: - State
    @State private var isLoading = false
    @EnvironmentObject private var colorProvider: ColorProvider
    
    // MARK: - Parameters
    private let text: String
    private let type: ButtonType
    private let leadingIcon: AlimoIconography?
    private let trailingIcon: AlimoIconography?
    private let isEnabled: Bool
    private let action: () async -> Void
    
    public init(
        _ text: String,
        type: ButtonType,
        leadingIcon: AlimoIconography? = nil,
        trailingIcon: AlimoIconography? = nil,
        isEnabled: Bool = true,
        action: @escaping () async -> Void
    ) {
        self.text = text
        self.type = type
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isEnabled = isEnabled
        self.action = action
    }
    
    public var body: some View {
        
        let color: SementicColor = isEnabled ? AlimoColor.Color.primary60 : AlimoColor.Background.normal
        
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
                        .alimoIconColor(color)
                        .frame(size: 20)
                }
                Text(text)
                    .alimoColor(color)
                    .alimoFont(type.font)
                    .opacity(isLoading ? 0 : 1)
                    .overlay {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: colorProvider.color(color)))
                        }
                    }
                if let trailingIcon {
                    Image(icon: trailingIcon)
                        .resizable()
                        .alimoIconColor(color)
                        .frame(size: 20)
                }
            }
            .padding(.horizontal, type.horizontalPadding)
        }
        .buttonStyle(AlimoTextButtonStyle(isLoading: isLoading, isEnabled: isEnabled, type: type))
        .disabled(isLoading)
    }
}

struct AlimoTextButtonStyle: ButtonStyle {
    private let isLoading: Bool
    private let isEnabled: Bool
    private let type: ButtonType
    
    init(
        isLoading: Bool,
        isEnabled: Bool,
        type: ButtonType
    ) {
        self.isLoading = isLoading
        self.isEnabled = isEnabled
        self.type = type
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(height: type.height)
            .if(type == .CTA) {
                $0.frame(maxWidth: .infinity)
            }
            .if(isEnabled) {
                $0.addPressAnimation(configuration.isPressed)
            }
    }
}
