import SwiftUI
import Nuke

public struct AlimoNotification<Destination: View>: View {
    private let title: String
    private let user: String
    private let content: String
    private var isSelected: Bool
    private let profileUrl: String?
    private let imageUrl: String?
    private let date: Date
    private let addEmojiAction: (EmojiType) -> Void
    private let bookmarkAction: () -> Void
    private let files: [FileInfo]
    private let fileDestination: () -> Destination
    private var hasEmoji = true
    @State private var emoji: EmojiType?
    
    public init(
        _ title: String,
        user: String,
        content: String,
        isSelected: Bool,
        profileUrl: String? = nil,
        imageUrl: String? = nil,
        date: Date,
        addEmojiAction: @escaping (EmojiType) -> Void,
        bookmarkAction: @escaping () -> Void,
        files: [FileInfo] = [],
        fileDestination: @escaping () -> Destination,
        hasEmoji: Bool,
        emoji: EmojiType? = nil
    ) {
        self.title = title
        self.user = user
        self.content = content
        self.isSelected = isSelected
        self.profileUrl = profileUrl
        self.imageUrl = imageUrl
        self.date = date
        self.addEmojiAction = addEmojiAction
        self.bookmarkAction = bookmarkAction
        self.files = files
        self.fileDestination = fileDestination
        self.hasEmoji = hasEmoji
        self._emoji = State(initialValue: emoji)
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AlimoAvatar(profileUrl, type: .large)
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .alimoFont(.headline2B)
                        .alimoColor(AlimoColor.Label.normal)
                    
                    Text(user)
                        .alimoFont(.labelM)
                        .alimoColor(AlimoColor.Label.sub)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(content)
                        .alimoFont(.bodyR)
                        .alimoColor(AlimoColor.Label.normal)
                    
                    if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(height: 235)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 235)
                            case .failure:
                                EmptyView()
                                    .frame(height: 235)
                            @unknown default:
                                EmptyView()
                                    .frame(height: 235)
                            }
                        }
                    }
                    
                    ForEach(files, id: \.title) { fileInfo in
                        NavigationLink(destination: fileDestination()) {
                            AlimoFile(fileInfo: fileInfo)
                        }
                    }
                }
                
                Text(date.description)
                    .alimoFont(.captionM)
                    .alimoColor(AlimoColor.Label.em)
                
                HStack {
                    if hasEmoji {
                        AlimoEmojiMenu {
                            addEmojiAction($0)
                            emoji = $0
                        } content: {
                            if let emoji = emoji {
                                emoji.image
                                    .resizable()
                                    .frame(width: 28, height: 28)
                            } else {
                                Image(icon: .AddEmoji)
                                    .resizable()
                                    .frame(width: 28, height: 28)
                            }
                        }
                    } else {
                        Image(icon: .AddEmoji)
                            .resizable()
                            .alimoIconColor(AlimoColor.Label.alt)
                            .frame(size: 28)
                            .button { addEmojiAction(EmojiType.angry) }
                    }
                    
                    Spacer()
                    
                    Image(icon: .Bookmark)
                        .resizable()
                        .alimoIconColor(isSelected ? AlimoColor.Color.primary60 : AlimoColor.Label.alt)
                        .frame(size: 28)
                        .button {
                            bookmarkAction()
                        }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}


#Preview {
    AlimoNotification(
        "title",
        user: "user",
        content: "content",
        isSelected: true,
        date: .now,
        addEmojiAction: { emoji in
            print("\(emoji)")
        },
        bookmarkAction: {},
        files: [
            FileInfo(title: "B1nd인턴+여행계획서.jpg", type: .file(count: 3)) {},
            FileInfo(title: "B1nd인턴+여행계획서.jpg", type: .image(byte: 100)) {}
        ],
        fileDestination: {
            EmptyView()
        },
        hasEmoji: true,
        emoji: nil
    )
    .preview()
}
