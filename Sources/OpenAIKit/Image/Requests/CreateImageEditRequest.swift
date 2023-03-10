import AsyncHTTPClient
import NIOHTTP1
import Foundation

struct CreateImageEditRequest: Request {
    let method: HTTPMethod = .POST
    let host: String
    let path = "/v1/images/edits"
    let body: HTTPClient.Body?
    private let boundary = UUID().uuidString

    var headers: HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: "Content-Type", value: "multipart/form-data; boundary=\(boundary)")
        return headers
    }
    
    init(
        host: String,
        image: Data,
        mask: Data?,
        prompt: String,
        n: Int,
        size: Image.Size,
        user: String?
    ) throws {
        self.host = host
        
        let builder = MultipartFormDataBuilder(boundary: boundary)
        
        builder.addDataField(
            fieldName:  "image",
            fileName: "image.png",
            data: image,
            mimeType: "image/png"
        )
        
        if let mask = mask {
            builder.addDataField(
                fieldName:  "mask",
                fileName: "mask.png",
                data: mask,
                mimeType: "image/png"
            )
        }
        
        builder.addTextField(named: "prompt", value: prompt)
        builder.addTextField(named: "n", value: "\(n)")
        builder.addTextField(named: "size", value: size.rawValue)
        
        if let user = user {
            builder.addTextField(named: "user", value: user)
        }

        self.body = .data(builder.build())
    }
}
