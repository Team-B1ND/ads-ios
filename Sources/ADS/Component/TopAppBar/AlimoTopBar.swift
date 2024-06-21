import SwiftUI

public struct AlimoTopAppBar<C>: View where C: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var colorProvider: ColorProvider
    
    private let title: String
    private let background: SementicColor
    private let content: () -> C
    private let backButtonAction: (() -> Void)?
    private let trailingContent: AnyView
    
    public init(
        title: String,
        background: SementicColor,
        backButtonAction: (() -> Void)?,
        trailingContent: AnyView = AnyView(EmptyView()),
        @ViewBuilder content: @escaping () -> C
    ) {
        self.title = title
        self.background = background
        self.backButtonAction = backButtonAction
        self.trailingContent = trailingContent
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            colorProvider.color(background)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    if let backButtonAction {
                        Button {
                            backButtonAction()
                        } label: {
                            Image(icon: .ExpandLeft)
                                .resizable()
                                .alimoIconColor(AlimoColor.Label.normal)
                                .frame(size: 28)
                                .padding(2)
                        }
                    }
                    Text(title)
                        .alimoFont(backButtonAction == nil ? .title2B : .headline2M)
                        .alimoColor(AlimoColor.Label.normal)
                        .padding(.leading, 8)
                    Spacer()
                    trailingContent
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

public extension View {
    func alimoTopBar<TC>(
        _ title: String,
        background: SementicColor = AlimoColor.Background.alt,
        @ViewBuilder trailingContent: @escaping () -> TC = { EmptyView() },
        backButtonAction: (() -> Void)? = nil
    ) -> some View where TC: View {
        AlimoTopAppBar(
            title: title,
            background: background,
            backButtonAction: backButtonAction,
            trailingContent: AnyView(trailingContent())
        ) {
            self
        }
    }
}