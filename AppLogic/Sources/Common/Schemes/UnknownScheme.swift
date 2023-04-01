import Foundation
import GenericJSON

public struct UnknownScheme: DynamicScheme {
  public var type: DynamicSchemeType = .unknown
  public let id: String

  public init(id: String = UUID().uuidString) {
    self.id = id
  }

  // Initialize Scheme from reading properties in raw JSON
  static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id
    )
  }
  // Erase type to AnyDynamicScheme
  public func eraseToAnyDynamicScheme() -> AnyDynamicScheme {
    .init(
      id: self.id,
      type: self.type,
      raw: JSON.null
    )
  }
}
