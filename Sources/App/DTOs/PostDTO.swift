import Fluent
import Vapor

struct PostDTO: Content {
    var id: UUID?
    var headline: String?
    var content: String?
    var author: String?
    var category: Category?
    var publishedAt: Date?
    var updatedAt: Date?
    var isPublished: Bool?
    var imageURL: String?
    var viewsCount: Int?
    
    func toModel() -> Post {
        let model = Post()
        
        model.id = self.id
        model.publishedAt = self.publishedAt
        model.updatedAt = self.updatedAt
        model.isPublished = self.isPublished
        model.viewsCount = self.viewsCount
        if let headline = self.headline
            , let content = self.content
            , let author = self.author
            , let category = self.category
            , let imageURL = self.imageURL
        {
            model.headline = headline
            model.content = content
            model.author = author
            model.category = category
            model.imageURL = imageURL
        }
        return model
    }
}
