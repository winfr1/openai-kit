import AsyncHTTPClient
import NIOHTTP1
import Foundation

struct CreateModerationRequest: Request {
    let method: HTTPMethod = .POST
    let host: String
    let path = "/v1/moderations"
    let body: HTTPClient.Body?
    
    init(
        host: String,
        input: String,
        model: Moderation.Model
    ) throws {
        self.host = host
        
        let body = Body(
           input: input,
           model: model
        )
                
        self.body = .data(try Self.encoder.encode(body))
    }
}

extension CreateModerationRequest {
    struct Body: Encodable {
        let input: String
        let model: Moderation.Model
    }
}
