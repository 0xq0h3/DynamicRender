import Foundation

protocol DynamicScheme: Identifiable, Equatable {
  var id: String { get }
  var type: DynamicSchemeType { get }
}

extension Array where Element == any DynamicScheme {
  var typed: [any DynamicScheme] {
    guard let list = self as? [AnyDynamicScheme] else {
      return self
    }
    return list.map(\.typed)
  }
}
