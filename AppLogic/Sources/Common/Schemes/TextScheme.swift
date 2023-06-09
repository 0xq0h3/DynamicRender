import Foundation
import GenericJSON

public struct TextScheme: DynamicScheme {
  public var type: DynamicSchemeType = .text
  public let id: String
  public let text: String

  public init(id: String = UUID().uuidString, text: String) {
    self.id = id
    self.text = text
  }

  // Initialize Scheme from reading properties in raw JSON
  public static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      text: anyScheme.parse(prop: "text")
    )
  }
  // Erase type to AnyDynamicScheme
  public func eraseToAnyDynamicScheme() -> AnyDynamicScheme {
    .init(
      id: self.id,
      type: self.type,
      raw: [
        "text": JSON(stringLiteral: self.text),
      ]
    )
  }
}
