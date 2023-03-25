import Foundation

struct UnknownScheme: DynamicScheme {
  var type: DynamicSchemeType = .unknown
  let id: String

  static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id
    )
  }
}
