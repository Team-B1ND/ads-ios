import SwiftUI

public extension Image {
    func alimoIconColor(_ color: SementicColor) -> some View {
        self.renderingMode(.template)
            .alimoColor(color)
    }
    
    func alimoIconColor(_ color: AlimoColor.Color) -> some View {
        self.alimoIconColor(color as SementicColor)
    }
    
    func alimoIconColor(_ color: AlimoColor.Background) -> some View {
        self.alimoIconColor(color as SementicColor)
    }
    
    func alimoIconColor(_ color: AlimoColor.Elevation) -> some View {
        self.alimoIconColor(color as SementicColor)
    }
    
    func alimoIconColor(_ color: AlimoColor.Label) -> some View {
        self.alimoIconColor(color as SementicColor)
    }
    
    func alimoIconColor(_ color: AlimoColor.Warning) -> some View {
        self.alimoIconColor(color as SementicColor)
    }
}
