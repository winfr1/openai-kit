import Foundation

public struct ImageProvider {
    private let host: String
    private let requestHandler: RequestHandler
    
    init(host: String, requestHandler: RequestHandler) {
        self.host = host
        self.requestHandler = requestHandler
    }
    
    /**
     Create image
     POST
      
     https://api.openai.com/v1/images/generations

     Creates an image given a prompt.
     */
    public func create(
        prompt: String,
        n: Int = 1,
        size: Image.Size = .tenTwentyFour,
        user: String? = nil
    ) async throws -> ImageResponse {
        
        let request = try CreateImageRequest(
            host: host,
            prompt: prompt,
            n: n,
            size: size,
            user: user
        )
        
        return try await requestHandler.perform(request: request)
    }
    
    /**
     Create image edit
     POST
      
     https://api.openai.com/v1/images/edits

     Creates an edited or extended image given an original image and a prompt.
     */
    public func createEdit(
        image: Data,
        mask: Data? = nil,
        prompt: String,
        n: Int = 1,
        size: Image.Size = .tenTwentyFour,
        user: String? = nil
    ) async throws -> ImageResponse {
        
        let request = try CreateImageEditRequest(
            host: host,
            image: image,
            mask: mask,
            prompt: prompt,
            n: n,
            size: size,
            user: user
        )
        
        return try await requestHandler.perform(request: request)
    }
    
    /**
     Create image variation
     POST
      
     https://api.openai.com/v1/images/variations

     Creates a variation of a given image.
     */
    public func createVariation(
        image: Data,
        n: Int = 1,
        size: Image.Size = .tenTwentyFour,
        user: String? = nil
    ) async throws -> ImageResponse {
        
        let request = try CreateImageVariationRequest(
            host: host,
            image: image,
            n: n,
            size: size,
            user: user
        )
        
        return try await requestHandler.perform(request: request)
    }
    
}
