import CoreService

protocol RemoteImageDataSource {
  func store(_ content: [UInt8]) throws -> Image
}

protocol ImageDataSource {
  func store(_ image: Image) throws
  func get(with ids: [Identifier<Image>]) throws -> [Image]
}
