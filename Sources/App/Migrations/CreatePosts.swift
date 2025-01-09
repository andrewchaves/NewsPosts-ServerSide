import Fluent

struct CreatePosts: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("posts")
            .id()
            .field("headline", .string, .required)
            .field("content", .string, .required)
            .field("author", .string, .required)
            .field("category", .string, .required)
            .field("published_at", .date, .required)
            .field("updated_at", .date, .required)
            .field("is_published", .bool, .required)
            .field("image_url", .string, .required)
            .field("views_count", .int, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("posts").delete()
    }
}
