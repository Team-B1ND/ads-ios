public enum FileType {
    case image(byte: Int)
    case file(count: Int)
    
    var icon: AlimoIconography {
        switch self {
        case .image: .Image
        case .file: .File
        }
    }
}
