import NIOHTTP1
import Foundation

struct DeleteFileRequest: Request {
    let method: HTTPMethod = .DELETE
    let host: String
    let path: String
    
    init(host: String, id: String) {
        self.host = host
        self.path = "/v1/files/\(id)"
    }
}

