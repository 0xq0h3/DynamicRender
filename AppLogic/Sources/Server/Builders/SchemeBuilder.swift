import Foundation
import GenericJSON

import Common

class SchemeBuilder {
  init() { }

  func buildCustomScheme(imageURLs: [String], titles: [String], authors: [String]) -> [AnyDynamicScheme] {
    // Feel free to build anything!

    return []
  }

  func buildSimpleScheme(imageURL: String, text: String) -> [AnyDynamicScheme] {
    let image = ImageScheme(url: URL(withValid: imageURL), width: 300, height: 300).eraseToAnyDynamicScheme()
    let text = TextScheme(text: "Hello, World!").eraseToAnyDynamicScheme()
    let column = ColumnScheme(children: [image, text]).eraseToAnyDynamicScheme()
    return [column]
  }

  func buildFirstScheme(imageURLs: [String], titles: [String], authors: [String]) -> [AnyDynamicScheme] {
    let labels = zip(titles, authors)
      .map { (title, author) in
        let titleText = TextScheme(text: title).eraseToAnyDynamicScheme()
        let authorText = TextScheme(text: author).eraseToAnyDynamicScheme()
        return RowScheme(children: [titleText, authorText]).eraseToAnyDynamicScheme()
      }

    let firstScheme = zip(labels, imageURLs)
      .reduce([AnyDynamicScheme](), { acc, cur in
        var array = acc

        let (label, imageURL) = cur
        let imageScheme = ImageScheme(url: URL(withValid: imageURL), width: 150, height: 150).eraseToAnyDynamicScheme()
        let cellScheme = ColumnScheme(children: [imageScheme, label]).eraseToAnyDynamicScheme()

        array.append(cellScheme)
        return array
      })
      .chunks(ofCount: 2)
      .map { Array($0) }
      .map { json in
        let first = json.first ?? UnknownScheme().eraseToAnyDynamicScheme()
        let second = json.last ?? UnknownScheme().eraseToAnyDynamicScheme()

        return RowScheme(children: [first, second]).eraseToAnyDynamicScheme()
      }

    return firstScheme
  }

  func buildSecondScheme(imageURLs: [String], titles: [String], authors: [String]) -> [AnyDynamicScheme] {
    let labels = zip(titles, authors)
      .map { (title, author) in
        let titleText = TextScheme(text: title).eraseToAnyDynamicScheme()
        let authorText = TextScheme(text: author).eraseToAnyDynamicScheme()
        return RowScheme(children: [titleText, authorText]).eraseToAnyDynamicScheme()
      }

    let secondScheme = zip(labels, imageURLs)
      .reduce([AnyDynamicScheme](), { acc, cur in
        var array = acc

        let (label, imageURL) = cur
        let imageScheme = ImageScheme(url: URL(withValid: imageURL), width: 300, height: 300).eraseToAnyDynamicScheme()
        let cellScheme = ColumnScheme(children: [imageScheme, label]).eraseToAnyDynamicScheme()

        array.append(cellScheme)
        return array
      })

    return secondScheme
  }
}
