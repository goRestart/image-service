import JSON

struct ImageViewModel {
  let identifier: String
  let url: String
}

extension ImageViewModel: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("id", identifier)
    try json.set("url", url)
    return json
  }
}
