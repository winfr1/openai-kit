import NIOHTTP1
import Foundation

struct RetrieveFileContentRequest: Request {
    let method: HTTPMethod = .GET
    let host: String
    let path: String
    
    init(host: String, id: String) {
        self.host = host
        self.path = "/v1/files/\(id)/content"
    }
}

