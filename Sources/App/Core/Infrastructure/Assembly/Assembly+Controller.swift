import CoreService

extension Assembly {
  var imageRouteCollection: ImageRouteCollection {
    return ImageRouteCollection(
      uploadController: uploadController
    )
  }
  
  private var uploadController: UploadController {
    return UploadController(
      uploadImage: uploadImage,
      imageViewMapper: imageViewMapper
    )
  }
}
