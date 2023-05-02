import SwiftUI

public struct ContentView: View {
  @StateObject var viewModel = DynamicRenderViewModel()
  @StateObject var alertState = AlertState(isShown: false, message: "")
  @StateObject var sheetState = SheetState(isShown: false, shortID: "")

  public init() {}
  public var body: some View {
    VStack {
      Button("Refresh") {
        Task {
         try await viewModel.fetchScheme()
        }
      }
      .tint(.blue)
      .controlSize(.large)
      .buttonStyle(.bordered)

      ScrollView {
        DynamicRenderer(schemes: viewModel.scheme)
          .environmentObject(alertState)
          .environmentObject(sheetState)
      }
    }
    .task {
      do {
        try await viewModel.fetchScheme()
      } catch {
        print("error: \(error)")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
