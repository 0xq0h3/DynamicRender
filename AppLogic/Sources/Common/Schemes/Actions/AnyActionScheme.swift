import Foundation
import GenericJSON

public struct AnyActionScheme: ActionScheme, Equatable, Codable {
  public var id: String
  public let type: ActionSchemeType
//  public let extra: JSON
  public let raw: JSON

  public var typed: any ActionScheme {
    switch type {
    case .openWebview:
      return OpenWebviewActionScheme.buildFromAnyScheme(self)
    case .sheet:
      return SheetActionScheme.buildFromAnyScheme(self)
    case .alert:
      return AlertActionScheme.buildFromAnyScheme(self)
    case .unknown:
      return AlertActionScheme(id: "", message: "unknown")
    }
  }

  public init(id: String, type: ActionSchemeType, raw: JSON) {
    self.id = id
    self.type = type
//    self.extra = extra
    self.raw = raw
  }

  public static func buildSchemeFrom(_ json: JSON) -> AnyActionScheme {
    .init(
      id: json[keyPath: "id"]?.stringValue ?? UUID().uuidString,
      type: ActionSchemeType(rawValue: json[keyPath: "type"]?.stringValue ?? "") ?? .unknown,
//      extra: json[keyPath: "extra"] ?? .null,
      raw: json
    )
  }

//  public func eraseToAnyActionScheme() -> JSON {
//    return [
//      "id": JSON(stringLiteral: self.id),
//      "type": JSON(stringLiteral: self.type.rawValue),
//      "extra": self.extra
//    ]
//  }

  public func toJSON() -> JSON {

    let json: JSON = [
      "id": JSON(stringLiteral: self.id),
      "type": JSON(stringLiteral: self.type.rawValue),
      "extra": self.raw
    ]
    return json
  }
}
