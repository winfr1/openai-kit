import AsyncHTTPClient
import NIOHTTP1
import Foundation

struct CreateImageRequest: Request {
    let method: HTTPMethod = .POST
    let host: String
    let path = "/v1/images/generations"
    let body: HTTPClient.Body?
    
    init(
        host: String,
        prompt: String,
        n: Int,
        size: Image.Size,
        user: String?
    ) throws {
        self.host = host
        
        let body = Body(
            prompt: prompt,
            n: n,
            size: size,
            user: user
        )
                
        self.body = .data(try Self.encoder.encode(body))
    }
}

extension CreateImageRequest {
    struct Body: Encodable {
        let prompt: String
        let n: Int
        let size: Image.Size
        let user: String?
    }
}
