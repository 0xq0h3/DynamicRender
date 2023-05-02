import Foundation
import GenericJSON

public struct ButtonScheme: DynamicScheme {
  public var type: DynamicSchemeType = .button
  public let id: String
  public let title: String
  public let action: AnyActionScheme?

  public init(id: String = UUID().uuidString, title: String, action: AnyActionScheme? = nil) {
    self.id = id
    self.title = title
    self.action = action
  }

  // Initialize Scheme from reading properties in raw JSON
  public static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      title: anyScheme.parse(prop: "title"),
      action: anyScheme.parse()
    )
  }

  // Erase type to AnyDynamicScheme
  public func eraseToAnyDynamicScheme() -> AnyDynamicScheme {
    .init(
      id: self.id,
      type: self.type,
      raw: [
        "title": JSON(stringLiteral: self.title),
        "action": self.action?.toJSON() ?? ""
      ]
    )
  }
}
