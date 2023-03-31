import Foundation

public extension URL {
  static let notFound = URL(string: "https://team.alar.my/")!
  
  init(withValid urlString: String) {
    self.init(string: urlString)!
  }
}
