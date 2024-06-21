import SwiftUI
import UIKit

// MARK: - SwiftUI
public extension View {
    func alimoElevation(_ ev: AlimoElevation) -> some View {
        self
            .shadow(color: ev.color, radius: ev.radius, x: ev.x, y: ev.y)
    }
}

// MARK: - UIKit
public extension UIView {
    func alimoElevation(_ ev: AlimoElevation) -> UIView {
        self
//            .shadow(color: ev.uiColor, radius: ev.radius, opacity: ev.uiColor.alpha)
    }
}
