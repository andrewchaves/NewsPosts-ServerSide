import Fluent
import Vapor

struct PostsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("posts")

        todos.get(use: self.index)
        todos.post(use: self.create)
        todos.group(":postID") { todo in
            todo.delete(use: self.delete)
        }
    }

    @Sendable
    func index(req: Request) async throws -> [PostDTO] {
        try await Post.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> PostDTO {
        let todo = try req.content.decode(PostDTO.self).toModel()

        try await todo.save(on: req.db)
        return todo.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await Post.find(req.parameters.get("postID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await todo.delete(on: req.db)
        return .noContent
    }
}
