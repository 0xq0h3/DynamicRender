import Foundation
import SwiftUI

struct RowSchemeView: View {
  let scheme: RowScheme

  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      DynamicRenderer(schemes: scheme.children)
    }
  }
}
