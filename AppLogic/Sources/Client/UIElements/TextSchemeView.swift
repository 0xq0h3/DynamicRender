import Foundation
import SwiftUI

import Common

struct TextSchemeView: View {
    let scheme: TextScheme

    var body: some View {
      Text(scheme.text)
    }
}
