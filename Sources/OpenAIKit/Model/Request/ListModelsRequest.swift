import NIOHTTP1
import Foundation

struct ListModelsRequest: Request {
    let method: HTTPMethod = .GET
    let host: String
    let path = "/v1/models"
}

