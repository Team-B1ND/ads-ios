public enum FileType {
    case image(byte: Int)
    case file(count: Int)
    
    public var icon: AlimoIconography {
        switch self {
        case .image: .Image
        case .file: .File
        }
    }
}

public struct FileInfo {
    public let title: String
    public let type: FileType
    public let action: () -> Void
}
