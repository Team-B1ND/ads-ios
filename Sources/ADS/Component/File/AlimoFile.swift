import SwiftUI

public struct AlimoFile: View {
    
    public let fileInfo: FileInfo
    
    public init(fileInfo: FileInfo) {
        self.fileInfo = fileInfo
    }
    
    private var descriptionColor: SementicColor {
        if case .file = fileInfo.type {
            AlimoColor.Color.primary60
        } else {
            AlimoColor.Label.em
        }
    }
    
    private var description: String {
        switch fileInfo.type {
        case .image(let byte):
            "\(byte) byte"
        case .file(let count):
            "총 \(count)개 파일"
        }
    }
    
    public var body: some View {
        HStack {
            Image(icon: fileInfo.type.icon)
                .resizable()
                .alimoIconColor(AlimoColor.Color.neutral00)
                .frame(size: 24)
                .padding(2)
                .alimoBackground(AlimoColor.Color.primary60)
                .cornerRadius(14, corners: .allCorners)
            VStack(alignment: .leading, spacing: 2) {
                Text(fileInfo.title)
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
                    fileInfo.action()
                }
        }
        .padding(12)
        .alimoBackground(AlimoColor.Background.normal)
        .cornerRadius(4, corners: .allCorners)
    }
}

#Preview {
    VStack {
        AlimoFile(fileInfo: FileInfo(title: "B1nd인턴+여행계획서.jpg", type: .file(count: 3)) {})
        AlimoFile(fileInfo: FileInfo(title: "B1nd인턴+여행계획서.jpg", type: .image(byte: 100)) {})
    }
    .preview(background: AlimoColor.Background.alt)
}

#Preview("AlimoFileDark") {
    VStack {
        AlimoFile(fileInfo: FileInfo(title: "B1nd인턴+여행계획서.jpg", type: .file(count: 3)) {})
        AlimoFile(fileInfo: FileInfo(title: "B1nd인턴+여행계획서.jpg", type: .image(byte: 100)) {})
    }
    .preview(isDarkTheme: true, background: AlimoColor.Background.alt)
}
