import Foundation

struct UploadImage {
  
  private let imageRepository: ImageRepository
  
  init(imageRepository: ImageRepository) {
    self.imageRepository = imageRepository
  }
  
  func execute(with content: [UInt8]) throws -> Image {
    return try imageRepository.store(content)
  }
}
