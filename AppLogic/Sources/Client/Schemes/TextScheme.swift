import Foundation

struct TextScheme: DynamicScheme {
  var type: DynamicSchemeType = .text
  let id: String
  let text: String
  
  static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      text: anyScheme.parse(prop: "text")
    )
  }
}
