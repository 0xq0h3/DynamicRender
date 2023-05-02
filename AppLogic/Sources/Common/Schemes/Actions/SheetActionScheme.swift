import Foundation
import GenericJSON

public struct SheetActionScheme: ActionScheme {
  public let id: String
  public let type = ActionSchemeType.sheet
  public let shortID: String


  public init(id: String = UUID().uuidString, shortID: String) {
    self.id = id
    self.shortID = shortID
  }

  public static func buildFromAnyScheme(_ anyScheme: AnyActionScheme) -> SheetActionScheme {
    let dict = anyScheme.raw[keyPath: "extra"]?.objectValue
    let shortID = dict?["shortID"]?.stringValue ?? ""
    return .init(
      id: anyScheme.id,
      shortID: shortID
    )
  }

  public func eraseToAnyAction() -> AnyActionScheme {
    .init(
      id: self.id,
      type: self.type,
      raw: [
        "shortID": JSON(stringLiteral: self.shortID)
      ]
    )
  }
}
