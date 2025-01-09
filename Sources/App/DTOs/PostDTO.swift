import Fluent
import Vapor

struct PostDTO: Content {
    var id: UUID?
    var headline: String?
    var content: String?
    var author: String?
    var category: String?
    var publishedAt: Date?
    var updatedAt: Date?
    var isPublished: Bool?
    var imageURL: String?
    var viewsCount: Int?
    
    func toModel() -> Post {
        let model = Post()
        
        model.id = self.id
        if let headline = self.headline
            , let content = self.content
            , let author = self.author
            , let publishedAt = self.publishedAt
            , let updatedAt = self.updatedAt
            , let isPublished = self.isPublished
            , let imageURL = self.imageURL
            , let viewsCount = self.viewsCount
        {
            model.headline = headline
            model.content = content
            model.author = author
            model.publishedAt = publishedAt
            model.updatedAt = updatedAt
            model.isPublished = isPublished
            model.imageURL = imageURL
            model.viewsCount = viewsCount
        }
        return model
    }
}
