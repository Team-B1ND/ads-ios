import SwiftUI

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: RoundedCornerShape.RectCorner = .allCorners) -> some View {
        self.clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
    
    func stroke<Content>(_ radius: CGFloat, corners: RoundedCornerShape.RectCorner = .allCorners, content: Content, lineWidth: CGFloat = 1) -> some View where Content: ShapeStyle {
        let roundedCorner = RoundedCornerShape(radius: radius, corners: corners)
        return self
            .clipShape(roundedCorner)
            .overlay {
                roundedCorner
                    .stroke(content, lineWidth: lineWidth)
            }
    }
}
#Preview {
    RoundedCornerShape(radius: 10)
        .frame(size: 200)
//        .stroke(12, content: Color.blue)
//        .frame(size: 26)
}
