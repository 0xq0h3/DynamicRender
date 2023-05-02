import Foundation
import GenericJSON

public struct AnyDynamicScheme: DynamicScheme, Codable {
  public var id: String
  public let type: DynamicSchemeType
  public let raw: JSON

  public init(id: String, type: DynamicSchemeType, raw: JSON) {
    self.id = id
    self.type = type
    self.raw = raw
  }

  // Concrete Type implements DynamicScheme
  // Build specific Schemes from raw JSON
  var typed: any DynamicScheme {
    switch type {
    case .row:
      return RowScheme.buildSchemeFrom(self)
    case .column:
      return ColumnScheme.buildSchemeFrom(self)
    case .text:
      return TextScheme.buildSchemeFrom(self)
    case .image:
      return ImageScheme.buildSchemeFrom(self)
    case .button:
      return ButtonScheme.buildSchemeFrom(self)
    case .unknown:
      return UnknownScheme.buildSchemeFrom(self)
    }
  }
}

// Parse property into type
public extension AnyDynamicScheme {
  func parse(prop key: String) -> CGFloat {
    guard let value = raw[keyPath: key]?.doubleValue else {
      return 0
    }
    return CGFloat(value)
  }

  func parse(prop key: String) -> URL {
    guard let urlString = raw[keyPath: key]?.stringValue else {
      return URL.notFound
    }

    return URL(withValid: urlString)
  }

  func parse(prop key: String) -> String {
    let stringValue = raw[keyPath: key]?.stringValue ?? ""

    return stringValue
  }

  func parse(prop key: String) -> [any DynamicScheme] {
    let arrayValue = raw[keyPath: key]?.arrayValue ?? []

    return arrayValue.map { child in
      guard let typeValue = child["type"]?.stringValue,
            let childType = DynamicSchemeType(rawValue: typeValue),
            let childID =  child["id"]?.stringValue,
            let childRaw = child["raw"] else {
        return UnknownScheme(id: UUID().uuidString)
      }

      return AnyDynamicScheme(id: childID, type: childType, raw: childRaw).typed
    }
  }
}

// Parse property into type
public extension AnyDynamicScheme {
  func parse() -> AnyActionScheme? {
    guard let rawAction = raw[keyPath: "action"],
          rawAction != .null else {
      return nil
    }
    return AnyActionScheme.buildSchemeFrom(rawAction)
  }
}
