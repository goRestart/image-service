import CoreService

extension Assembly {
  var uploadImage: UploadImage {
    return UploadImage(
      imageRepository: imageRepository
    )
  }
}
