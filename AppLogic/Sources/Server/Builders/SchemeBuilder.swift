import Foundation
import GenericJSON

import Common

class SchemeBuilder {
  init() { }

//  func buildCustomScheme(imageURLs: [String], titles: [String], authors: [String]) -> [AnyDynamicScheme] {
//    // Feel free to build anything!
//    let image1 = ImageScheme(url: URL(withValid: imageURLs[0]), width: 300, height: 300).eraseToAnyDynamicScheme()
//    let title1 = TextScheme(text: titles[0]).eraseToAnyDynamicScheme()
//    let authors1 = TextScheme(text: authors[0]).eraseToAnyDynamicScheme()
//
//    let image2 = ImageScheme(url: URL(withValid: imageURLs[1]), width: 150, height: 150).eraseToAnyDynamicScheme()
//    let title2 = TextScheme(text: titles[1]).eraseToAnyDynamicScheme()
//    let authors2 = TextScheme(text: authors[1]).eraseToAnyDynamicScheme()
//
//    let image3 = ImageScheme(url: URL(withValid: imageURLs[2]), width: 150, height: 150).eraseToAnyDynamicScheme()
//    let title3 = TextScheme(text: titles[2]).eraseToAnyDynamicScheme()
//    let authors3 = TextScheme(text: authors[2]).eraseToAnyDynamicScheme()
//
//    let row1 = RowScheme(children: [image2, title2, authors2]).eraseToAnyDynamicScheme()
//    let row2 = RowScheme(children: [image3, title3, authors3]).eraseToAnyDynamicScheme()
//
//    let column1 = ColumnScheme(children: [image1, title1, authors1]).eraseToAnyDynamicScheme()
//    let column2 = ColumnScheme(children: [row1, row2]).eraseToAnyDynamicScheme()
//
//    return [column1, column2]
//  }

  func buildSimpleScheme(imageURL: String, text: String) -> [AnyDynamicScheme] {
    let image = ImageScheme(url: URL(withValid: imageURL), width: 300, height: 300).eraseToAnyDynamicScheme()
    let text = TextScheme(text: "Hello, World!").eraseToAnyDynamicScheme()
    let alertAction = AlertActionScheme(message: "ALERT").eraseToAnyAction()
    let sheetAction = SheetActionScheme(shortID: "1234").eraseToAnyAction()
    let button = ButtonScheme(title: "Hello", action: sheetAction).eraseToAnyDynamicScheme()

    let column = ColumnScheme(children: [image, button]).eraseToAnyDynamicScheme()
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
      .map { ele in
        let (label, imageURL) = ele
        let imageScheme = ImageScheme(url: URL(withValid: imageURL), width: 150, height: 150).eraseToAnyDynamicScheme()
        let cellScheme = ColumnScheme(children: [imageScheme, label]).eraseToAnyDynamicScheme()

        return cellScheme
      }.chunks(ofCount: 2)
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
      .map { ele in
        let (label, imageURL) = ele
        let imageScheme = ImageScheme(url: URL(withValid: imageURL), width: 300, height: 300).eraseToAnyDynamicScheme()
        let cellScheme = ColumnScheme(children: [imageScheme, label]).eraseToAnyDynamicScheme()

        return cellScheme
      }

    return secondScheme
  }
}
