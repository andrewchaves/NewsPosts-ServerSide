import Fluent
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class Post: Model, @unchecked Sendable {
    static let schema = "Posts"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "headline")
    var headline: String
    
    @Field(key: "content")
    var content: String

    init() { }

    init(id: UUID? = nil, headline: String, content: String) {
        self.id = id
        self.headline = headline
    }
    
    func toDTO() -> PostDTO {
        .init(
            id: self.id,
            headline: self.$headline.value, // ADIÇÃO DO $ Foi sugerida pelo compilador, não entendi o porquê
            content: self.$content.value // ADIÇÃO DO $ Foi sugerida pelo compilador, não entendi o porquê
        )
    }
}
