//
//  File.swift
//
//
//  Created by dgsw8th61 on 6/23/24.
//

import SwiftUI

public struct AlimoNotification: View {
    
    private let title: String
    private let user: String
    private let content: String
    @State private var isSelected: Bool
    private let profileUrl: String?
    private let imageUrl: String?
    private let date : String
    private let addEmojiAction: () -> Void
    private let bookmarkAction: () -> Void
    
    public init(
        _ title: String,
        user: String,
        content: String,
        isSelected: Bool,
        profileUrl: String? = nil,
        imageUrl: String? = nil,
        date: String,
        addEmojiAction: @escaping () -> Void,
        bookmarkAction: @escaping () -> Void
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
    }
    
    public var body: some View {
        
        VStack{
            HStack(alignment: .top, spacing: 10){
                if let profileUrl = profileUrl {
                    AlimoAvatar(profileUrl, type: .large)
                } else {
                    AlimoAvatar(type: .large)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .alimoFont(.headline2B)
                        .alimoColor(AlimoColor.Label.normal)
                    
                    Text(user)
                        .alimoFont(.labelM)
                        .alimoColor(AlimoColor.Label.sub)
                    
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
                    
                    Text(date)
                        .alimoFont(.captionM)
                        .alimoColor(AlimoColor.Label.em)
                    
                    HStack{
                        Button(action: {
                            addEmojiAction()
                        }, label: {
                            Image(icon: .AddEmoji)
                                .resizable()
                                .alimoIconColor(AlimoColor.Label.alt)
                                .frame(size: 20)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            bookmarkAction()
                            isSelected.toggle()
                        }, label: {
                            Image(icon: .Bookmark)
                                .resizable()
                                .alimoIconColor(isSelected ?
                                                AlimoColor.Color.primary60  : AlimoColor.Label.alt)
                                .frame(size: 20)
                        })
                        
                    }
                }
                Spacer()
            }
        }
        .padding(.horizontal,10)
    }
}

#Preview {
    AlimoNotification(
        "title",
        user: "user",
        content: "content",
        isSelected: false,
        date: "2023년 1월 33일 오후 25:3",
        addEmojiAction: {
            
        },
        bookmarkAction: {
            
        }
    )
    .preview()
}
