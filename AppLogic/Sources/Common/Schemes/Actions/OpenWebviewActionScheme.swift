import Foundation

public struct OpenWebviewActionScheme: ActionScheme {
  public let id: String
  public let type = ActionSchemeType.openWebview
  public let url: URL

  public static func buildFromAnyScheme(_ anyScheme: AnyActionScheme) -> OpenWebviewActionScheme {
    .init(
      id: anyScheme.id,
      url: URL(withValid: anyScheme.raw[keyPath: "url"]?.stringValue ?? "")
    )
  }
}
