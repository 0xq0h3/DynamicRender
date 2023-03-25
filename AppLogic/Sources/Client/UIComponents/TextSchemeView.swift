import Foundation
import SwiftUI

struct TextSchemeView: View {
    let scheme: TextScheme

    var body: some View {
      Text(scheme.text)
    }
}
