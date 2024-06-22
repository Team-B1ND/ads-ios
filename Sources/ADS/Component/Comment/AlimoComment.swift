//
//  File.swift
//
//
//  Created by dgsw8th61 on 6/23/24.
//

import SwiftUI

public enum CommentType {
    case comment
    case subcomment
}

public struct AlimoComment: View {
    private let name : String
    private let type: CommentType
    private let date: String
    private let content: String
    private let action: () -> Void
    
    
    public init(
        _ name: String,
        type: CommentType,
        date: String,
        content: String,
        action : @escaping () -> Void
    ) {
        self.name = name
        self.type = type
        self.date = date
        self.content = content
        self.action = action
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 13){
            AlimoAvatar(type: .large)
            VStack(alignment: .leading, spacing: 3){
                HStack(alignment:.bottom, spacing: 5){
                    Text(name)
                        .alimoColor(AlimoColor.Label.normal)
                        .alimoFont(.labelM)
                    
                    Text(date)
                        .alimoColor(AlimoColor.Label.em)
                        .alimoFont(.captionM)
                }
                
                Text(content)
                    .alimoColor(AlimoColor.Label.normal)
                    .alimoFont(.labelM)
                
                if type == .comment {
                    Button(action: {
                        action()
                    }, label: {
                        Text("답글")
                            .alimoColor(AlimoColor.Label.em)
                            .alimoFont(.captionM)
                            .background(
                                GeometryReader { geometry in
                                    VStack {
                                        Spacer()
                                        Rectangle()
                                            .frame(width: geometry.size.width, height: 1)
                                            .alimoColor(AlimoColor.Label.em)
                                    }
                                }
                            )
                    })
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 20){
        AlimoComment("알리모", type: .comment, date: "2025년 3월 1일", content: "내용") {}
        AlimoComment("알리모", type: .subcomment, date: "2025년 3월 1일", content: "내용") {}
    }
    .preview(isDarkTheme: true)
}
