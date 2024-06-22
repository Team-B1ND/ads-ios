import SwiftUI

public struct AlimoTextEditor: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    // MARK: - parameters
    private let isEnabled: Bool
    private let isRounded: Bool
    
    public init(
        text: Binding<String>,
        isEnabled: Bool = true,
        isRounded: Bool = false
    ) {
        self._text = text
        self.isEnabled = isEnabled
        self.isRounded = isRounded
    }
    
    /// focusedColor / enabledColor / disabledColor
    private var strokeColor: SementicColor {
        isEnabled ? isFocused ? AlimoColor.Color.primary60 : AlimoColor.Label.alt as SementicColor : AlimoColor.Label.back
    }
    
    private var textColor: SementicColor {
        isEnabled ? !text.isEmpty ? AlimoColor.Label.normal : AlimoColor.Label.alt : AlimoColor.Label.back
    }
    
    private var iconColor: SementicColor {
        isEnabled ? AlimoColor.Label.alt : AlimoColor.Label.back
    }
    
    // MARK: - View
    public var body: some View {
        let radius: CGFloat = isRounded ? 26 : 12
        TextEditor(text: $text)
            .disabled(!isEnabled)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .textContentType(.init(rawValue: ""))
            .textEditorBackground(.clear)
            .focused($isFocused)
            .alimoFont(.bodyM)
            .cornerRadius(radius, corners: .allCorners)
            .padding(.vertical, 8)
            .padding(.horizontal, 12) // for inner padding
            .accentColor(colorProvider.color(AlimoColor.Color.primary60)) // for indicator color
            .alimoColor(textColor) // for text color
            .stroke(radius, content: colorProvider.color(strokeColor), lineWidth: 1.5) // for stroke color
            .onTapGesture {
                isFocused = true
            }
            .padding(.vertical, 0.5)
    }
}

#Preview {
    VStack {
        AlimoTextEditor(text: .constant(""))
        AlimoTextEditor(text: .constant(""), isEnabled: false)
    }
    .frame(height: 300)
    .preview()
}

#Preview("AlimoTextEditorDark") {
    VStack {
        AlimoTextEditor(text: .constant(""))
        AlimoTextEditor(text: .constant(""), isEnabled: false)
    }
    .frame(height: 300)
    .preview(isDarkTheme: true)
}
