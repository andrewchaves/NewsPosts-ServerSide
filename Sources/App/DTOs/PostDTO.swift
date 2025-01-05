import Fluent
import Vapor

struct PostDTO: Content {
    var id: UUID?
    var headline: String?
    var content: String?
    
    func toModel() -> Post {
        let model = Post()
        
        model.id = self.id
        if let headline = self.headline, let content = self.content {
            model.headline = headline
            model.content = content
        }
        return model
    }
}
