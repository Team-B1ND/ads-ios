//
//  File.swift
//  
//
//  Created by dgsw8th61 on 7/29/24.
//

import SwiftUI

struct AlimoBookMark : View {
    private var isSelected: Bool
    private let bookmarkAction: () -> Void
    private let title: String
    private let content: String
    private let date: String
    private let category: [String]

    public init(
        isSelected: Bool,
        bookmarkAction: @escaping () -> Void,
        title: String,
        content: String,
        date: String,
        category: [String]
    ) {
        self.isSelected = isSelected
        self.bookmarkAction = bookmarkAction
        self.title = title
        self.content = content
        self.date = date
        self.category = category
    }
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 8)
                .alimoColor(AlimoColor.Background.sub)
                .frame(height: 174)
                .frame(maxWidth: .infinity)
                .overlay{
                    HStack{
                        VStack(alignment: .leading,spacing: 4){
                            Image(icon: .Bookmark)
                                .resizable()
                                .alimoIconColor(isSelected ? AlimoColor.Color.primary60 : AlimoColor.Label.alt)
                                .frame(size: 28)
                                .button {
                                    bookmarkAction()
                                }
                            
                            Text(title)
                                .alimoFont(.headline2B)
                                .alimoColor(AlimoColor.Label.normal)
                            
                            Text(content)
                                .alimoFont(.bodyR)
                                .alimoColor(AlimoColor.Label.normal)
                                .lineLimit(1)
                                .truncationMode(.tail)

                            
                            Text(date.description)
                                .alimoFont(.captionM)
                                .alimoColor(AlimoColor.Label.em)
                            
                            HStack{
                                ForEach(category.indices, id: \.self) { index in
                                    RoundedRectangle(cornerRadius: 100)
                                        .frame(width: 57,height: 30)
                                        .alimoColor(AlimoColor.Background.normal)
                                        .overlay{
                                            Text(category[index])
                                                .alimoColor(AlimoColor.Label.em)
                                                .alimoFont(.labelM)
                                        }
                                    
                                }
                                Spacer()
                            }
                            .padding(.top,7)
                        }
                        Spacer()
                    }
                    .padding(.horizontal,20)
                }
                .padding(10)
        }
    }
}

#Preview {
    AlimoBookMark(isSelected: true,
                  bookmarkAction: {}, 
                  title: "test", 
                  content: "hellohellohellohellohellohellohellohellohellohello",
                  date: "2023년 1월 33일 오후 25:3",
                  category: ["서브1","서브2","서브3","서브4"]
    )
        .preview()
}
