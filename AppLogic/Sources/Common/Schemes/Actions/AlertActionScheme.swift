import Foundation
import GenericJSON

public struct AlertActionScheme: ActionScheme {
  public let id: String
  public let type = ActionSchemeType.alert
  public let message: String

  public init(id: String = UUID().uuidString, message: String) {
    self.id = id
    self.message = message
  }
  
  public static func buildFromAnyScheme(_ anyScheme: AnyActionScheme) -> AlertActionScheme {
    let dict = anyScheme.raw[keyPath: "extra"]?.objectValue
    let message = dict?["message"]?.stringValue ?? ""
    return .init(
      id: anyScheme.id,
      message: message
    )
  }

  public func eraseToAnyAction() -> AnyActionScheme {
    .init(
      id: self.id,
      type: self.type,
      raw: [
        "message": JSON(stringLiteral: self.message)
      ]
    )
  }
}
