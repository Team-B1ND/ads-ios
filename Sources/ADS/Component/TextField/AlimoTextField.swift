import SwiftUI

public struct AlimoTextField: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    @Binding private var text: String
    @State private var isHide = true
    
    // MARK: - parameters
    private let hint: String
    private let isSecured: Bool
    private let isEnabled: Bool
    private let isRounded: Bool
    
    public init(
        _ hint: String = "",
        text: Binding<String>,
        isSecured: Bool = false,
        isEnabled: Bool = true,
        isRounded: Bool = false
    ) {
        self.hint = hint
        self._text = text
        self.isSecured = isSecured
        self.isEnabled = isEnabled
        self.isRounded = isRounded
    }
    
    // MARK: - View
    public var body: some View {
        Group {
            if isSecured && isHide {
                SecureField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foregroundColor(colorProvider.color(AlimoColor.Label.alt))
                )
            } else {
                TextField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foregroundColor(colorProvider.color(AlimoColor.Label.alt))
                )
            }
        }
        .textFieldStyle(
            AlimoTextFieldStyle(
                text: $text,
                isSecured: isSecured,
                isHide: $isHide,
                isEnabled: isEnabled,
                isRounded: isRounded
            )
        )
        .disabled(!isEnabled)
    }
}

struct AlimoTextFieldStyle: TextFieldStyle {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    @FocusState private var isFocused: Bool
    @Binding private var text: String
    @Binding private var isHide: Bool
    
    // MARK: - Parameters
    private let isSecured: Bool
    private let isEnabled: Bool
    private let isRounded: Bool
    
    init(
        text: Binding<String>,
        isSecured: Bool,
        isHide: Binding<Bool>,
        isEnabled: Bool,
        isRounded: Bool
    ) {
        self._text = text
        self.isSecured = isSecured
        self._isHide = isHide
        self.isEnabled = isEnabled
        self.isRounded = isRounded
    }
    
    /// focusedColor / enabledColor / disabledColor
    private var strokeColor: SementicColor {
        isEnabled ? isFocused ? AlimoColor.Color.primary60 : AlimoColor.Label.alt as SementicColor : AlimoColor.Label.back
    }
    
    private var textColor: SementicColor {
        isEnabled ? AlimoColor.Label.normal : AlimoColor.Label.back
    }
    
    private var iconColor: SementicColor {
        isEnabled ? AlimoColor.Label.alt : AlimoColor.Label.back
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        let radius: CGFloat = isRounded ? 26 : 12
        return configuration
        #if os(iOS)
            .textInputAutocapitalization(.never)
        #endif
            .autocorrectionDisabled()
            .textContentType(.init(rawValue: ""))
            .focused($isFocused)
            .alimoFont(.bodyM)
            .frame(height: 52)
            .cornerRadius(radius, corners: .allCorners)
            .padding(.horizontal, 12) // for inner padding
            .accentColor(colorProvider.color(AlimoColor.Color.primary60)) // for indicator color
            .alimoColor(textColor) // for text color
            .stroke(radius, content: colorProvider.color(strokeColor), lineWidth: 1.5) // for stroke color
            .overlay(
                HStack(spacing: 0) {
                    Spacer()
                    Group {
                        if isEnabled {
                            if isSecured {
                                Image(icon: isHide ? .Hide : .Show)
                                    .resizable()
                                    .alimoIconColor(iconColor)
                                    .onTapGesture {
                                        isHide.toggle()
                                    }
                            } else if !text.isEmpty {
                                Image(icon: .CloseFill)
                                    .resizable()
                                    .alimoIconColor(iconColor)
                                    .onTapGesture {
                                        text = ""
                                    }
                            }
                        }
                    }
                    .frame(size: 28)
                }
                .padding(.trailing, 8)
            )
            .onTapGesture {
                isFocused = true
            }
    }
}

private struct TextFieldPreview: View {
    @State private var email1 = ""
    @State private var email2 = ""
    var body: some View {
        VStack {
            AlimoTextField("이메일을 입력해주세요", text: $email1)
            AlimoTextField("이메일을 입력해주세요", text: $email2, isEnabled: false, isRounded: false)
        }
    }
}

#Preview {
    TextFieldPreview()
        .preview()
}

#Preview("AlimoTextFieldDark") {
    TextFieldPreview()
        .preview(isDarkTheme: true)
}
