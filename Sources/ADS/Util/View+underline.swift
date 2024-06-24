import SwiftUI

public extension View {
    func underline(color: SementicColor, height: CGFloat = 1) -> some View {
        self
            .background(
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(width: geometry.size.width, height: height)
                            .alimoColor(color)
                    }
                }
            )
    }
}
