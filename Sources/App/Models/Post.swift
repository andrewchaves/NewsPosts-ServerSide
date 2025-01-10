import Fluent
import Foundation

import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class Post: Model, @unchecked Sendable {
    
    static let schema = "posts"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "headline")
    var headline: String
    
    @Field(key: "content")
    var content: String
    
    @Field(key: "author")
    var author: String
    
    @Field(key: "category")
    var category: String
    
    @Field(key: "published_at")
    var publishedAt: Date?
    
    @Field(key: "updated_at")
    var updatedAt: Date?
    
    @Field(key: "is_published")
    var isPublished: Bool?
    
    @Field(key: "image_url")
    var imageURL: String
    
    @Field(key: "views_count")
    var viewsCount: Int?
    
    init() { }
    
    init(id: UUID? = nil,
         headline: String,
         content: String,
         author: String,
         category: String,
         publishedAt: Date,
         updatedAt: Date,
         isPublished: Bool,
         imageURL: String,
         viewsCount: Int
    ) {
        self.id = id
        self.headline = headline
        self.content = content
        self.author = author
        self.category = category
        self.publishedAt = publishedAt
        self.updatedAt = updatedAt
        self.isPublished = isPublished
        self.imageURL = imageURL
        self.viewsCount = viewsCount
    }
    
    func toDTO() -> PostDTO {
        .init(
            id: self.id,
            headline: self.headline,
            content: self.content,
            author: self.author,
            category: self.category,
            publishedAt: self.publishedAt,
            updatedAt: self.updatedAt,
            isPublished: self.isPublished,
            imageURL: self.imageURL,
            viewsCount: self.viewsCount
        )
    }
}
