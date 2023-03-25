import SwiftUI

struct ImageSchemeView: View {
  let scheme: ImageScheme

  var body: some View {
    AsyncImage(url: scheme.url) { image in
      image
        .resizable()
        .frame(width: scheme.width, height: scheme.height)
    } placeholder: {
      Color.gray
    }
  }
}
