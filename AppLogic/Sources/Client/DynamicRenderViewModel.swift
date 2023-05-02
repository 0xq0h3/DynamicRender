import Foundation

import Common

class DynamicRenderViewModel: ObservableObject {
  @Published var scheme = [any DynamicScheme]()

  func fetchScheme() async throws {
    let urlString = "http://127.0.0.1:8080/schemes/"
    guard let url = URL(string: urlString) else {
      throw APIError.invalidURL
    }
    let schemeResponse: UISchemePageResponse = try await HTTPClient.shared.fetch(url: url)

    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.scheme = schemeResponse.ui
    }
  }

  func loadPageDetail(_ shortID: String) async throws {
    let urlString = "http://127.0.0.1:8080/detail/\(shortID)"
    guard let url = URL(string: urlString) else {
      throw APIError.invalidURL
    }
    let schemeResponse: UISchemePageResponse = try await HTTPClient.shared.fetch(url: url)

    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.scheme = schemeResponse.ui
    }
  }
}
