import Foundation
import SwiftUI

struct ColumnSchemeView: View {
  let scheme: ColumnScheme
  
  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      DynamicRenderer(schemes: scheme.children)
    }
  }
}
