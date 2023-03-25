import Foundation

struct ImageScheme: DynamicScheme {
  var type: DynamicSchemeType = .image

  let id: String
  let url: URL
  let width: CGFloat
  let height: CGFloat

  static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      url: anyScheme.parse(prop: "url"),
      width: anyScheme.parse(prop: "width"),
      height: anyScheme.parse(prop: "height")
    )
  }
}
