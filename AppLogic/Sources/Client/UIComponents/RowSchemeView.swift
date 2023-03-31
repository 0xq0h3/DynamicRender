import Foundation
import SwiftUI

import Common

struct RowSchemeView: View {
  let scheme: RowScheme

  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      DynamicRenderer(schemes: scheme.children)
    }
  }
}
