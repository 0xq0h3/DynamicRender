import SwiftUI

import Common

struct ButtonSchemeView: View {
  let scheme: ButtonScheme
  let action: ExecutableAction

  @EnvironmentObject var alertState: AlertState
  @EnvironmentObject var sheetState: SheetState

  public init(scheme: ButtonScheme) {
    self.scheme = scheme
    self.action = ExecutableAction(scheme.action)
  }

  var body: some View {
    Button {
      executeAction()
    } label: {
      Text(scheme.title)
    }
    .alert(alertState.message, isPresented: $alertState.isShown) {

    }
    .sheet(isPresented: $sheetState.isShown) {
      DetailPageView(shortID: sheetState.shortID)
    }
  }

  func executeAction() {
    guard let typedAction = scheme.action?.typed else { return }
    if let alertAction = typedAction as? AlertActionScheme {
      alertState.message = alertAction.message
      alertState.isShown = true
    } else if let sheetAction = typedAction as? SheetActionScheme {
      sheetState.shortID = sheetAction.shortID
      sheetState.isShown = true
    }
  }
}

class AlertState: ObservableObject {
  @Published var isShown: Bool
  @Published var message: String

  init(isShown: Bool, message: String) {
    self.isShown = isShown
    self.message = message
  }
}


class SheetState: ObservableObject {
  @Published var isShown: Bool
  @Published var shortID: String

  init(isShown: Bool, shortID: String) {
    self.isShown = isShown
    self.shortID = shortID
  }
}
