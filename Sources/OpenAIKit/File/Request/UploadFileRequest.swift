import NIOHTTP1
import Foundation
import AsyncHTTPClient

struct UploadFileRequest: Request {
    let method: HTTPMethod = .POST
    let host: String
    let path = "/v1/files"
    let body: HTTPClient.Body?
    private let boundary = UUID().uuidString
    
    var headers: HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: "Content-Type", value: "multipart/form-data; boundary=\(boundary)")
        return headers
    }
    
    init(
        host: String,
        file: Data,
        fileName: String,
        purpose: File.Purpose
    ) throws {
        self.host = host
        
        let builder = MultipartFormDataBuilder(boundary: boundary)
        
        builder.addDataField(
            fieldName:  "file",
            fileName: fileName,
            data: file,
            mimeType: "application/json"
        )
        
        builder.addTextField(named: "purpose", value: purpose.rawValue)
        
        self.body = .data(builder.build())
    }
}

