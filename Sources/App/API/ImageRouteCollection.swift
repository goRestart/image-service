import Vapor

private struct Endpoint {
  static let upload = "/upload"
  static let list = "/"
}

struct ImageRouteCollection: RouteCollection {
  
  private let uploadController: UploadController
  private let imageController: ImageController
  
  init(uploadController: UploadController,
       imageController: ImageController)
  {
    self.uploadController = uploadController
    self.imageController = imageController
  }
  
  func build(_ builder: RouteBuilder) throws {
    builder.post(Endpoint.upload) { request in
      return try self.uploadController.upload(with: request)
    }
    builder.get(Endpoint.list) { request in
      return try self.imageController.list(with: request)
    }
  }
}
