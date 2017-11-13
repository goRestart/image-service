import Foundation
import CoreService
import S3

struct S3RemoteImageDataSource: RemoteImageDataSource {
  
  private let s3: S3
  
  init(s3: S3) {
    self.s3 = s3
  }
  
  func store(_ content: [UInt8]) throws -> Image {
    let imageId = Identifier<Image>(
      UUID().uuidString
    )
    
    let destination = "/\(imageId.value)"
    let response = try s3.put(content, destinationPath: destination, acl: .publicRead)
    
    return Image(
      identifier: imageId,
      url: response.url,
      storageUrl: response.s3Url
    )
  }
}
