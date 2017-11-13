import Vapor

private struct Endpoint {
  static let upload = "/upload"
}

struct ImageRouteCollection: RouteCollection {
  func build(_ builder: RouteBuilder) throws {
    builder.post(Endpoint.upload) { request in
      return "ok"
    }
  }
}
