import Foundation
import SwiftUI

public struct DetailPageView: View {
  @StateObject var viewModel = DynamicRenderViewModel()

  public let shortID: String

  public init(shortID: String) {
    self.shortID = shortID
  }
  
  public var body: some View {
    VStack {
      ScrollView {
        DynamicRenderer(schemes: viewModel.scheme)
      }
    }
    .task {
      do {
        try await viewModel.loadPageDetail(shortID)
      } catch {
        print("error: \(error)")
      }
    }
  }
}
