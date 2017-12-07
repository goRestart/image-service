import CoreService

struct GetImagesByIds {
  
  private let imageRepository: ImageRepository
  
  init(imageRepository: ImageRepository) {
    self.imageRepository = imageRepository
  }
  
  func execute(with ids: [Identifier<Image>]) throws -> [Image] {
    return try imageRepository.get(with: ids)
  }
}
