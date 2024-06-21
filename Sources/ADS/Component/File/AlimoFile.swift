import SwiftUI

public struct AlimoFile: View {
    
    private let title: String
    private let type: FileType
    private let action: () -> Void
    
    public init(
        _ title: String,
        type: FileType,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.type = type
        self.action = action
    }
    
    private var descriptionColor: SementicColor {
        if case .file = type {
            AlimoColor.Color.primary60
        } else {
            AlimoColor.Label.alt
        }
    }
    private var description: String {
        switch type {
        case .image(let byte):
            "\(byte) byte"
        case .file(let count):
            "총 \(count)개 파일"
        }
    }
    
    public var body: some View {
        HStack {
            Image(icon: type.icon)
                .resizable()
                .alimoIconColor(AlimoColor.Color.neutral00)
                .frame(size: 24)
                .padding(2)
                .alimoBackground(AlimoColor.Color.primary60)
                .cornerRadius(14, corners: .allCorners)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .alimoFont(.labelM)
                    .alimoColor(AlimoColor.Label.normal)
                Text(description)
                    .alimoFont(.captionM)
                    .alimoColor(descriptionColor)
            }
            Spacer()
            Image(icon: .ExpandStopDown)
                .resizable()
                .alimoIconColor(AlimoColor.Label.alt)
                .frame(size: 24)
                .button {
                    action()
                }
        }
        .padding(12)
        .alimoBackground(AlimoColor.Background.normal)
        .cornerRadius(4, corners: .allCorners)
    }
}

#Preview {
    VStack {
        AlimoFile("B1nd인턴+여행계획서.jpg", type: .file(count: 3)) {
            
        }
        AlimoFile("B1nd인턴+여행계획서.jpg", type: .image(byte: 100)) {
            
        }
    }
    .padding(20)
    .alimoBackground(AlimoColor.Background.alt)
    .registerPretendard()
    .environmentObject(ColorProvider(isDarkTheme: true))
}
