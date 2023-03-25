import Foundation

struct ColumnScheme: DynamicScheme {
  var type: DynamicSchemeType = .column
  let id: String
  let children: [any DynamicScheme]

  static func buildSchemeFrom(_ anyScheme: AnyDynamicScheme) -> Self {
    .init(
      id: anyScheme.id,
      children: anyScheme.parse(prop: "children")
    )
  }
}

extension ColumnScheme: Equatable {
  static func == (lhs: ColumnScheme, rhs: ColumnScheme) -> Bool {
    return lhs.id == rhs.id
  }
}
