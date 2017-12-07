import CoreService

extension Assembly {
  var imageRouteCollection: ImageRouteCollection {
    return ImageRouteCollection(
      uploadController: uploadController,
      imageController: imageController
    )
  }
  
  private var uploadController: UploadController {
    return UploadController(
      uploadImage: uploadImage
    )
  }
  
  private var imageController: ImageController {
    return ImageController(
      getImagesByIds: getImagesByIds
    )
  }
}
