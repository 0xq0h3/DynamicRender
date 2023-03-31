import Foundation
import GenericJSON

public struct UnknownScheme: DynamicScheme {
  public var type: DynamicSchemeType = .unknown
  public let id: String

  public init(id: String = UUID().uuidString) {
    self.id = id
  }

  static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id
    )
  }

  public func eraseToAnyDynamicScheme() -> AnyDynamicScheme {
    .init(
      id: self.id,
      type: self.type,
      raw: JSON.null
    )
  }
}
