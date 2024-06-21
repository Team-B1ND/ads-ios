import SwiftUI

public extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

public struct AlimoColorViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: SementicColor
    
    public init(
        color: SementicColor
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .foregroundStyle(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}


public struct AlimoBackgroundViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: SementicColor
    
    public init(
        color: SementicColor
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .background(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}

public struct AlimoTintViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: SementicColor
    
    public init(
        color: SementicColor
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .tint(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}

public extension View {
    func alimoColor(_ color: SementicColor) -> some View {
        self.modifier(AlimoColorViewModifier(color: color))
    }
    
    func alimoBackground(_ color: SementicColor) -> some View {
        self.modifier(AlimoBackgroundViewModifier(color: color))
    }
    
    func alimoTint(_ color: SementicColor) -> some View {
        self.modifier(AlimoTintViewModifier(color: color))
    }
}

public class ColorProvider: ObservableObject {
    
    @Published public var isDarkTheme: Bool {
        didSet {
            UserDefaults.standard.setValue(isDarkTheme, forKey: "isDarkTheme")
        }
    }
    
    public init(isDarkTheme: Bool) {
        self.isDarkTheme = isDarkTheme
    }
    
    public func color(_ color: SementicColor) -> Color {
        isDarkTheme ? color.darkColor : color.lightColor
    }
}
