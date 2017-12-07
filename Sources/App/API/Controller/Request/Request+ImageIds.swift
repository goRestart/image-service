import HTTP
import CoreService

private struct Parameter {
  static let id = "id"
}

extension Request {
  func extract() throws -> [Identifier<Image>] {
    guard let ids = data[Parameter.id]?.array else {
      throw ImageIdError.missingParameters
    }
    return ids.flatMap { $0.uuid }
      .map { uuid in
        Identifier<Image>(uuid.uuidString)
    }
  }
}
