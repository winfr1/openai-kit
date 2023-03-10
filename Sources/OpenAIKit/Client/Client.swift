import AsyncHTTPClient
import NIO
import NIOHTTP1
import Foundation

public struct Client {
    public let host: String
    public let models: ModelProvider
    public let completions: CompletionProvider
    public let chats: ChatProvider
    public let edits: EditProvider
    public let images: ImageProvider
    public let embeddings: EmbeddingProvider
    public let files: FileProvider
    public let moderations: ModerationProvider

    public init(
        host: String,
        httpClient: HTTPClient,
        configuration: Configuration
    ) {
        self.host = host

        let requestHandler = RequestHandler(
            httpClient: httpClient,
            configuration: configuration
        )
                
        self.models = ModelProvider(host: host, requestHandler: requestHandler)
        self.completions = CompletionProvider(host: host, requestHandler: requestHandler)
        self.chats = ChatProvider(host: host, requestHandler: requestHandler)
        self.edits = EditProvider(host: host, requestHandler: requestHandler)
        self.images = ImageProvider(host: host, requestHandler: requestHandler)
        self.embeddings = EmbeddingProvider(host: host, requestHandler: requestHandler)
        self.files = FileProvider(host: host, requestHandler: requestHandler)
        self.moderations = ModerationProvider(host: host, requestHandler: requestHandler)
        
    }

}
