import FluentProvider

final class ImageDiskModel: Model {
  
  let storage = Storage()
  
  var url: String
  var storageUrl: String
  
  init(identifier: Identifier,
       url: String,
       storageUrl: String)
  {
    self.url = url
    self.storageUrl = storageUrl
    self.id = identifier
  }
  
  init(row: Row) throws {
    url = try row.get(Keys.url)
    storageUrl = try row.get(Keys.storageUrl)
  }
  
  func makeRow() throws -> Row {
    var row = Row()
    try row.set(Keys.url, url)
    try row.set(Keys.storageUrl, storageUrl)
    return row
  }
  
  // MARK: - Database keys
  
  struct Keys {
    static let url = "url"
    static let storageUrl = "storage_url"
  }
}

// MARK: - Customizations

extension ImageDiskModel: Timestampable {
  static let name = "image"
  static let entity = "images"
}

// MARK: - Preparations

extension ImageDiskModel: Preparation {
  static func prepare(_ database: Database) throws {
    try database.create(ImageDiskModel.self) { builder in
      builder.id()
      builder.string(Keys.url, unique: true)
      builder.string(Keys.storageUrl, unique: true)
    }
  }
  
  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}
