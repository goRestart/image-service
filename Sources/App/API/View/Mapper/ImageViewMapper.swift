import CoreService

struct ImageViewMapper: Mappable {
  
  func map(_ from: Image) throws -> ImageViewModel {
    return ImageViewModel(
      identifier: from.identifier.value,
      url: from.url
    )
  }
}
