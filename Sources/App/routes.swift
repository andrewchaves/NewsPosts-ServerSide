import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("help") { req async -> String in
        "Our only hope is Jesus Christ."
    }

    try app.register(collection: PostsController())
}
