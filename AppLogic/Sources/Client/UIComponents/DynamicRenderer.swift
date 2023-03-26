import Foundation
import SwiftUI
import Logic

struct DynamicRenderer: View {
  let schemes: [any DynamicScheme]

  var body: some View {
    ForEach(schemes.typed, id: \.id) { scheme in
      Spacer()
      Self.render(scheme: scheme)
      Spacer()
    }
  }
}

extension DynamicRenderer {
  static func render(scheme: any DynamicScheme) -> AnyView {
    switch scheme {
    case let rowScheme as RowScheme:
      return RowSchemeView(scheme: rowScheme).eraseToAnyView()
    case let columnScheme as ColumnScheme:
      return ColumnSchemeView(scheme: columnScheme).eraseToAnyView()
    case let imageScheme as ImageScheme:
      return ImageSchemeView(scheme: imageScheme).eraseToAnyView()
    case let textScheme as TextScheme:
      return TextSchemeView(scheme: textScheme).eraseToAnyView()
    case let imageScheme as ImageScheme:
      return ImageSchemeView(scheme: imageScheme).eraseToAnyView()

    default:
      return Text("Not found").eraseToAnyView()
    }
  }
}
