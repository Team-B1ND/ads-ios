import SwiftUI

public extension View {
    
    @ViewBuilder
    func registerPretendard() -> some View {
        let _ = Pretendard.register()
        self
    }
}
