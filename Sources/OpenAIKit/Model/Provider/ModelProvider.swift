public struct ModelProvider {
    private let host: String
    private let requestHandler: RequestHandler
    
    init(host: String, requestHandler: RequestHandler) {
        self.host = host
        self.requestHandler = requestHandler
    }
    
    /**
     List models
     GET
      
     https://api.openai.com/v1/models

     Lists the currently available models, and provides basic information about each one such as the owner and availability.
     */
    public func list() async throws -> [Model] {
        let request = ListModelsRequest(host: host)
        
        let response: ListModelsResponse = try await requestHandler.perform(request: request)
        
        return response.data
    }
    
    /**
     Retrieve model
     GET
      
     https://api.openai.com/v1/models/{model}

     Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
     */
    public func retrieve(id: String) async throws -> Model {
        let request = RetrieveModelRequest(host: host, id: id)
    
        return try await requestHandler.perform(request: request)
    }
    
}
