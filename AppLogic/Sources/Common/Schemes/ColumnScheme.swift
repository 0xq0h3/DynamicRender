import Foundation
import GenericJSON

public struct ColumnScheme: DynamicScheme {
  public var type: DynamicSchemeType = .column
  public let id: String
  public let children: [any DynamicScheme]

  public init(id: String = UUID().uuidString, children: [any DynamicScheme]) {
    self.id = id
    self.children = children
  }

  // Initialize Scheme from reading properties in raw JSON
  public static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      children: anyScheme.parse(prop: "children")
    )
  }
  // Erase type to AnyDynamicScheme
  public func eraseToAnyDynamicScheme() -> AnyDynamicScheme {
    let children = self.children.map { child in
      let scheme = child as? AnyDynamicScheme
      if let json = try? JSON(encodable: scheme) {
        return json
      }
      return JSON.null
    }
    guard let childrenScheme = try? JSON(encodable: children) else {
      return AnyDynamicScheme(id: UUID().uuidString, type: .unknown, raw: .null)
    }

    return AnyDynamicScheme(
      id: self.id,
      type: self.type,
      raw: [
        "children": childrenScheme
      ]
    )
  }
}

extension ColumnScheme: Equatable {
  public static func == (lhs: ColumnScheme, rhs: ColumnScheme) -> Bool {
    return lhs.id == rhs.id
  }
}
