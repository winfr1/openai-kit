import NIOHTTP1
import Foundation

struct RetrieveModelRequest: Request {
    let method: HTTPMethod = .GET
    let host: String
    let path: String
    
    init(host: String, id: String) {
        self.host = host
        self.path = "/v1/models/\(id)"
    }
}


