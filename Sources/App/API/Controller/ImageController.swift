import Vapor

struct ImageController {
  
  private let getImagesByIds: GetImagesByIds
  
  init(getImagesByIds: GetImagesByIds) {
    self.getImagesByIds = getImagesByIds
  }
  
  func list(with request: Request) throws -> ResponseRepresentable {
    do {
      return try getImagesByIds.execute(
        with: request.extract()
      ).makeResponse()
    } catch ImageIdError.missingParameters {
      return Response.missingParameters
    }
  }
}
