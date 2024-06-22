import SwiftUI

public struct AlimoToggle: View {
    
    @Binding private var isOn: Bool
    
    public init(
        isOn: Binding<Bool>
    ) {
        self._isOn = isOn
    }
    
    private var color: SementicColor {
        isOn ? AlimoColor.Color.primary60 : AlimoColor.Label.alt
    }
    
    public var body: some View {
        Toggle("", isOn: $isOn)
            .alimoTint(color)
            .fixedSize()
    }
}
