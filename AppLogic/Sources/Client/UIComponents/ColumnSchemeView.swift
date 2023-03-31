import Foundation
import SwiftUI

import Common

struct ColumnSchemeView: View {
  let scheme: ColumnScheme
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      DynamicRenderer(schemes: scheme.children)
    }
  }
}
