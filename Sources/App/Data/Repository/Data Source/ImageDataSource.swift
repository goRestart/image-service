protocol RemoteImageDataSource {
  func store(_ content: [UInt8]) throws -> Image
}

protocol ImageDataSource {
  func store(_ image: Image) throws
}