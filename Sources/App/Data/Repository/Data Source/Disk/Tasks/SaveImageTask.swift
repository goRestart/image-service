import Fluent

struct SaveImageTask {
  
  func execute(with image: Image) throws {
    let diskImage = ImageDiskModel(
      identifier: Identifier(image.identifier.value),
      url: image.url,
      storageUrl: image.storageUrl
    )
    try diskImage.save()
  }
}
