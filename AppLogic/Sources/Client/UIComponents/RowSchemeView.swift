import Foundation
import SwiftUI

struct RowSchemeView: View {
  let scheme: RowScheme

  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      DynamicRenderer(schemes: scheme.children)
    }
  }
}
