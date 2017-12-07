import Foundation
import CoreService

struct ImageRepository {
  
  private let remoteDataSource: RemoteImageDataSource
  private let diskDataSource: ImageDataSource
  
  init(remoteDataSource: RemoteImageDataSource,
       diskDataSource: ImageDataSource)
  {
    self.remoteDataSource = remoteDataSource
    self.diskDataSource = diskDataSource
  }
  
  func store(_ content: [UInt8]) throws -> Image {
    let image = try remoteDataSource.store(content)
    try diskDataSource.store(image)
    return image
  }
  
  func get(with ids: [Identifier<Image>]) throws -> [Image] {
    return try diskDataSource.get(with: ids)
  }
}
