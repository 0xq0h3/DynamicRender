import Vapor
import GenericJSON

import Common

final class DynamicSchemeResponse: Content {
  let ui: [AnyDynamicScheme]

  init(ui: [AnyDynamicScheme]) {
    self.ui = ui
  }
}
