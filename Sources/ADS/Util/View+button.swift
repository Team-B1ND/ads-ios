import SwiftUI

public extension View {
    func button(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
    }
}
