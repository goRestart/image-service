import Foundation
import CoreService

struct ImageDiskDataSource: ImageDataSource {

  private let saveImageTask: SaveImageTask
  private let getImagesByIdsTask: GetImagesByIdsTask
  
  init(saveImageTask: SaveImageTask,
       getImagesByIdsTask: GetImagesByIdsTask)
  {
    self.saveImageTask = saveImageTask
    self.getImagesByIdsTask = getImagesByIdsTask
  }
  
  func store(_ image: Image) throws {
    try saveImageTask.execute(with: image)
  }
  
  func get(with ids: [Identifier<Image>]) throws -> [Image] {
    return try getImagesByIdsTask.execute(with: ids)
  }
}
