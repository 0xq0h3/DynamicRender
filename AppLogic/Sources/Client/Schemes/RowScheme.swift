import Foundation

struct RowScheme: DynamicScheme {
  var type: DynamicSchemeType = .row
  let id: String
  let children: [any DynamicScheme]

  static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      children: anyScheme.parse(prop: "children")
    )
  }
}

extension RowScheme: Equatable {
  static func == (lhs: RowScheme, rhs: RowScheme) -> Bool {
    return lhs.id == rhs.id
  }
}
