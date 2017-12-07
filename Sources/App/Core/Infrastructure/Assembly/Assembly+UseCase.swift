import CoreService

extension Assembly {
  var uploadImage: UploadImage {
    return UploadImage(
      imageRepository: imageRepository
    )
  }
  
  var getImagesByIds: GetImagesByIds {
    return GetImagesByIds(
      imageRepository: imageRepository
    )
  }
}
