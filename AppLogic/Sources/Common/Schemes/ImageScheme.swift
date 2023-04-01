import GenericJSON

import Foundation

public struct ImageScheme: DynamicScheme {
  public var type: DynamicSchemeType = .image

  public let id: String
  public let url: URL
  public let width: CGFloat
  public let height: CGFloat

  public init(
    id: String = UUID().uuidString,
    url: URL,
    width: CGFloat,
    height: CGFloat
  ) {
    self.id = id
    self.url = url
    self.width = width
    self.height = height
  }

  // Initialize Scheme from reading properties in raw JSON
  public static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      url: anyScheme.parse(prop: "url"),
      width: anyScheme.parse(prop: "width"),
      height: anyScheme.parse(prop: "height")
    )
  }

  // Erase type to AnyDynamicScheme
  public func eraseToAnyDynamicScheme() -> AnyDynamicScheme {
    .init(
      id: self.id,
      type: self.type,
      raw: [
        "url": JSON(stringLiteral: self.url.absoluteString),
        "width": JSON(floatLiteral: Double(self.width)),
        "height": JSON(floatLiteral: Double(self.height))
      ]
    )
  }
}
