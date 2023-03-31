import Foundation

public protocol DynamicScheme: Identifiable, Equatable {
  var id: String { get }
  var type: DynamicSchemeType { get }
}

extension Array where Element == any DynamicScheme {
  public var typed: [any DynamicScheme] {
    guard let list = self as? [AnyDynamicScheme] else {
      return self
    }
    return list.map(\.typed)
  }
}
