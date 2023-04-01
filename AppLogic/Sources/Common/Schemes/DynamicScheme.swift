import Foundation

// Protocol described in JSON as Array
public protocol DynamicScheme: Identifiable, Equatable {
  var id: String { get }
  var type: DynamicSchemeType { get }
}

extension Array where Element == any DynamicScheme {
  // Array of any DynamicScheme
  // Typing elements as AnyDynamicScheme for rendering in iteration
  public var typed: [any DynamicScheme] {
    guard let list = self as? [AnyDynamicScheme] else {
      return self
    }
    return list.map(\.typed)
  }
}
