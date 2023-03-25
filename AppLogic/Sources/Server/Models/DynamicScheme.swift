import Fluent
import Vapor
import GenericJSON

final class DynamicSchemeResponse: Content {
  let ui: [DynamicScheme]

  init(ui: [DynamicScheme]) {
    self.ui = ui
  }
}


final class DynamicScheme: Content {
  let id: UUID
  let type: String
  var raw: JSON

  init(id: UUID, type: String, raw: JSON) {
    self.id = id
    self.type = type
    self.raw = raw
  }

  func toJSON() -> JSON {
    guard let json = try? JSON(encodable: self) else { return .null }
    return json
  }
}
