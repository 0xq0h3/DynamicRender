import Foundation
import Common

struct ExecutableAction {
  var scheme: AnyActionScheme?

  init(_ scheme: AnyActionScheme? = nil) {
    self.scheme = scheme
  }

  func callAsFunction() {
    guard let typedAction = scheme?.typed else { return }

    if let webviewAction = typedAction as? OpenWebviewActionScheme {
      print("OpenWebviewActionScheme: \(webviewAction.url.absoluteString)")
    } else if let sheetAction = typedAction as? SheetActionScheme {
      print("SheetActionScheme: \(sheetAction.shortID)")
    } else if let alertAction = typedAction as? AlertActionScheme {
      print("AlertActionScheme: \(alertAction.message)")
    } else {

    }
  }
}
