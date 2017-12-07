import Fluent
import CoreService

struct GetImagesByIdsTask {
  
  private let imageMapper: ImageMapper
  
  init(imageMapper: ImageMapper) {
    self.imageMapper = imageMapper
  }
  
  func execute(with ids: [CoreService.Identifier<Image>]) throws -> [Image] {
    let imageIds = ids.map { $0.value }
    let images = try ImageDiskModel
      .makeQuery()
      .filter(ImageDiskModel.idKey, in: imageIds)
      .all()
    
    return try imageMapper.map(elements: images)
  }
}
