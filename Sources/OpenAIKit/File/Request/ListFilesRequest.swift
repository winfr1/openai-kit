import NIOHTTP1
import Foundation

struct ListFilesRequest: Request {
    let method: HTTPMethod = .GET
    let host: String
    let path = "/v1/files"
}

