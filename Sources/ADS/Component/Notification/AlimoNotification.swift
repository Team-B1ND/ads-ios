//
//  File.swift
//
//
//  Created by dgsw8th61 on 6/23/24.
//

import SwiftUI
import Nuke

public struct AlimoNotification: View {
    
    private let title: String
    private let user: String
    private let content: String
    @Binding private var isSelected: Bool
    private let profileUrl: String?
    private let imageUrl: String?
    private let date: Date
    private let addEmojiAction: () -> Void
    private let bookmarkAction: () -> Void
    
    public init(
        _ title: String,
        user: String,
        content: String,
        isSelected: Binding<Bool>,
        profileUrl: String? = nil,
        imageUrl: String? = nil,
        date: Date,
        addEmojiAction: @escaping () -> Void,
        bookmarkAction: @escaping () -> Void
    ) {
        self.title = title
        self.user = user
        self.content = content
        self._isSelected = isSelected
        self.profileUrl = profileUrl
        self.imageUrl = imageUrl
        self.date = date
        self.addEmojiAction = addEmojiAction
        self.bookmarkAction = bookmarkAction
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
                
                VStack(spacing: 8) {
                    Text(content)
                        .alimoFont(.bodyR)
                        .alimoColor(AlimoColor.Label.normal)
                    
                    if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                        // TODO: apply Nuck
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
                    
                    // TODO: add file view
                }
                
                Text(date.description)
                    .alimoFont(.captionM)
                    .alimoColor(AlimoColor.Label.em)
                
                HStack {
                    Image(icon: .AddEmoji)
                        .resizable()
                        .alimoIconColor(AlimoColor.Label.alt)
                        .frame(size: 28)
                        .button {
                            addEmojiAction()
                        }
                    
                    Spacer()
                    Image(icon: .Bookmark)
                        .resizable()
                        .alimoIconColor(isSelected ?
                                        AlimoColor.Color.primary60  : AlimoColor.Label.alt)
                        .frame(size: 28)
                        .button {
                            bookmarkAction()
                            isSelected.toggle()
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
        isSelected: .constant(false),
        date: .now,
        addEmojiAction: {
            
        },
        bookmarkAction: {
            
        }
    )
    .preview()
}
