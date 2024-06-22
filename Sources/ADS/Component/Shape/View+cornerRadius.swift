import SwiftUI

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: RoundedCornerShape.RectCorner = .allCorners) -> some View {
        self.clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: [RoundedCornerShape.RectCorner]) -> some View {
        self.clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
    
    func stroke<Content>(_ radius: CGFloat, corners: RoundedCornerShape.RectCorner = .allCorners, content: Content, lineWidth: CGFloat = 1) -> some View where Content: ShapeStyle {
        self.stroke(radius, corners: [corners], content: content, lineWidth: lineWidth)
    }
    
    func stroke<Content>(_ radius: CGFloat, corners: [RoundedCornerShape.RectCorner], content: Content, lineWidth: CGFloat = 1) -> some View where Content: ShapeStyle {
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
    Rectangle()
}
