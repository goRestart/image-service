import HTTP
import CoreService

struct UploadController {
  
  private let uploadImage: UploadImage
  private let imageViewMapper: ImageViewMapper
  
  init(uploadImage: UploadImage,
       imageViewMapper: ImageViewMapper)
  {
    self.uploadImage = uploadImage
    self.imageViewMapper = imageViewMapper
  }
  
  func upload(with request: Request) throws -> ResponseRepresentable {
    guard let content = request.body.bytes, !content.isEmpty else {
      return Response.missingParameters
    }
    return try imageViewMapper.map(
      try uploadImage.execute(with: content)
    ).makeJSON()
  }
}
