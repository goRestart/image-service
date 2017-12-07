import CoreService

struct Image: Codable {
  let id: Identifier<Image>
  let url: String
  let storageUrl: String
}
