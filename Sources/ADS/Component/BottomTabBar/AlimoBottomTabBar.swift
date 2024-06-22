import SwiftUI

public struct AlimoBottomTabBar<C>: View where C: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let selectedTab: BottomTabType
    private let onTap: (BottomTabType) -> Void
    private let content: () -> C
    
    public init(
        selectedTab: BottomTabType,
        onTap: @escaping (BottomTabType) -> Void,
        content: @escaping () -> C
    ) {
        self.selectedTab = selectedTab
        self.onTap = onTap
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
            bottomBarBar
                .toBottom()
                .ignoresSafeArea()
        }
    }
    
    #if os(iOS)
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    #endif
    
    @ViewBuilder
    private var bottomBarBar: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(BottomTabType.allCases, id: \.self) { tab in
                Button {
                    if selectedTab != tab {
                        onTap(tab)
                    }
                } label: {
                    AlimoBottomTabItem(type: tab, isSelected: selectedTab == tab)
                }
                .applyAnimation()
            }
            Spacer()
        }
        #if os(iOS)
        .padding(.bottom, safeAreaInsets.bottom)
        #endif
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .alimoBackground(AlimoColor.Background.normal)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .stroke(16, corners: [.topLeft, .topRight], content: colorProvider.color(AlimoColor.Label.back))
        .onChange(of: selectedTab) { _ in
            #if os(iOS)
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
            #endif
        }
    }
}

#Preview {
    
    @State var selectedTab = BottomTabType.Home
    
    return AlimoBottomTabBar(selectedTab: selectedTab) {
        selectedTab = $0
    } content: {
        Text("content")
    }
    .environmentObject(ColorProvider(isDarkTheme: false))
}


#Preview("AlimoBottomTabBarDark") {
    
    @State var selectedTab = BottomTabType.Home
    
    return AlimoBottomTabBar(selectedTab: selectedTab) {
        selectedTab = $0
    } content: {
        Text("content")
    }
    .environmentObject(ColorProvider(isDarkTheme: true))
}

