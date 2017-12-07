import HTTP
import CoreService
import Foundation

struct UploadController {
  
  private let uploadImage: UploadImage

  init(uploadImage: UploadImage) {
    self.uploadImage = uploadImage
  }
  
  func upload(with request: Request) throws -> ResponseRepresentable {
    guard let content = request.body.bytes, !content.isEmpty else {
      return Response.missingParameters
    }
    return try uploadImage
      .execute(with: content)
      .makeResponse(status: .created)
  }
  
  func list(with request: Request) throws -> ResponseRepresentable {
    do {
      let imageIds = try request.extract()
      return try imageIds.makeResponse()
    } catch ImageIdError.missingParameters {
      return Response.missingParameters
    }
  }
}
