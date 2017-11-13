import Vapor

private struct Endpoint {
  static let upload = "/upload"
}

struct ImageRouteCollection: RouteCollection {
  
  private let uploadController: UploadController
  
  init(uploadController: UploadController) {
    self.uploadController = uploadController
  }
  
  func build(_ builder: RouteBuilder) throws {
    builder.post(Endpoint.upload) { request in
      return try self.uploadController.upload(with: request)
    }
  }
}
