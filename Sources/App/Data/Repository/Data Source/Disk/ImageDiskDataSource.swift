import Foundation
import CoreService

struct ImageDiskDataSource: ImageDataSource {

  private let saveImageTask: SaveImageTask
  
  init(saveImageTask: SaveImageTask) {
    self.saveImageTask = saveImageTask
  }
  
  func store(_ image: Image) throws {
    try saveImageTask.execute(with: image)
  }
  
  func get(with ids: [Identifier<Image>]) -> [Image] {
    return []
  }
}
