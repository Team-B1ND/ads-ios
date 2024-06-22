import SwiftUI

@available(macOS 13.0, *)
public struct AlimoLogoTopAppBar<C>: View where C: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var colorProvider: ColorProvider
    
    private let background: SementicColor
    private let content: () -> C
    
    public init(
        background: SementicColor,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.background = background
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            colorProvider.color(background)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(image: .MiniLogo)
                        .resizable()
                        .alimoIconColor(AlimoColor.Label.back)
                        .frame(width: 72, height: 18)
                        .padding(.leading, 12)
                    Spacer()
                }
                .frame(height: 54)
                .alimoBackground(background)
                .padding(.horizontal, 4)
                content()
            }
            .toTop()
            .navigationBarBackButtonHidden()
        }
    }
}

@available(macOS 13.0, *)
public extension View {
    func alimoLogoTopAppBar<TC>(
        background: SementicColor = AlimoColor.Background.alt,
        @ViewBuilder trailingContent: @escaping () -> TC = { EmptyView() }
    ) -> some View where TC: View {
        AlimoLogoTopAppBar(
            background: background
        ) {
            self
        }
    }
}

@available(macOS 13.0, *)
#Preview {
    Text("Hello Alimo")
        .alimoColor(AlimoColor.Label.normal)
        .alimoLogoTopAppBar()
        .preview(background: AlimoColor.Background.alt)
}

@available(macOS 13.0, *)
#Preview("AlimoLogoTopAppBarDark") {
    Text("Hello Alimo")
        .alimoColor(AlimoColor.Label.normal)
        .alimoLogoTopAppBar()
        .preview(isDarkTheme: true, background: AlimoColor.Background.alt)
}
