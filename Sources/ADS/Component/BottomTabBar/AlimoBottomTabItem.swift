import SwiftUI

struct AlimoBottomTabItem: View {
    
    let type: BottomTabType
    let isSelected: Bool
    
    init(
        type: BottomTabType,
        isSelected: Bool
    ) {
        self.type = type
        self.isSelected = isSelected
    }
    
    var body: some View {
        let color: SementicColor = isSelected ? AlimoColor.Color.primary60 : AlimoColor.Label.alt
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Image(icon: type.image)
                    .resizable()
                    .alimoIconColor(color)
                    .frame(width: 28, height: 28)
                Text(type.label)
                    .alimoFont(.captionR)
                    .alimoColor(color)
            }
            .padding(.vertical, 4)
            Spacer()
        }
    }
}
