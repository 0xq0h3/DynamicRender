import Foundation
import GenericJSON

class SchemeBuilder {
  init() { }

  func buildFirstScheme() -> [DynamicScheme] {
    let labels = zip(titles, authors)
      .map { (title, author) in
        let titleText = buildText(text: title)
        let authorText = buildText(text: author)

        return DynamicScheme(id: UUID(), type: "column", raw: ["children": [titleText, authorText]]).toJSON()
      }

    let firstScheme = zip(labels, imageURLs)
      .reduce([JSON](), { acc, cur in
        var array = acc

        let (label, imageURL) = cur
        let imageScheme = buildImage(imageURL: imageURL, width: 150, height: 150)
        let cellScheme = DynamicScheme(id: UUID(), type: "row", raw: ["children": [imageScheme, label]]).toJSON()

        array.append(cellScheme)
        return array
      })
      .chunks(ofCount: 2)
      .map { Array($0) }
      .map { json in
        let first = json.first ?? .null
        let second = json.last ?? .null
        return DynamicScheme(id: UUID(), type: "column", raw: ["children": [first, second]])
      }

    return firstScheme
  }

  func buildSecondScheme() -> [DynamicScheme] {
    let labels = zip(titles, authors)
      .map { (title, author) in
        let titleText = buildText(text: title)
        let authorText = buildText(text: author)

        return DynamicScheme(id: UUID(), type: "column", raw: ["children": [titleText, authorText]]).toJSON()
      }

    let secondScheme = zip(labels, imageURLs)
      .reduce([DynamicScheme](), { acc, cur in
        var array = acc

        let (label, imageURL) = cur
        let imageScheme = buildImage(imageURL: imageURL, width: 300, height: 300)
        let cellScheme = DynamicScheme(id: UUID(), type: "row", raw: ["children": [imageScheme, label]])

        array.append(cellScheme)
        return array
      })

    return secondScheme
  }

  func buildImage(imageURL: String, width: Double, height: Double) -> JSON {
    return DynamicScheme(
      id: UUID(),
      type: "image",
      raw: [
        "url": JSON(stringLiteral: imageURL),
        "width": JSON(floatLiteral: width),
        "height": JSON(floatLiteral: height)
      ]
    ).toJSON()
  }

  func buildText(text: String) -> JSON {
    return DynamicScheme(
      id: UUID(),
      type: "text",
      raw: [
        "text": JSON(stringLiteral: text)
      ]
    ).toJSON()
  }

  let titles = [
    "beach",
    "landscape",
    "sunset",
    "mountains",
    "car",
    "plant",
    "inside car",
    "rail road",
    "tram",
    "sea"
  ]

  let authors = [
    "Joseph Barrientos",
    "Philipp Reiner",
    "Lukasz Szmigiel",
    "Luca Zanon",
    "Alan Haverty",
    "Annie Spratt ",
    "Josh Felise",
    "Antoine Beauvillain",
    "Gabriel Garcia Marengo",
    "Anna Popović"
  ]
  
  let imageURLs = [
    "https://fastly.picsum.photos/id/653/400/400.jpg?hmac=7AxZLodHbyzBgQzwyqRenkCZ3rMhwtawLsYaDad64YM",
    "https://fastly.picsum.photos/id/206/400/400.jpg?hmac=ZfNzmwb_G-cENYBcFfGB0f-xCi3wb6TBkE-4eQGt7ys",
    "https://fastly.picsum.photos/id/413/400/400.jpg?hmac=-4Fi-wezu1Vi5MiN26ZcAqlCXNbyBGezeISVWgPAhQc",
    "https://fastly.picsum.photos/id/830/400/400.jpg?hmac=PTgxF7YOSn6WHgCetWwC3rZjxMcl69m0m9hUrV6nmTs",
    "https://fastly.picsum.photos/id/45/400/400.jpg?hmac=AS_lpTurKFnN1CVE5xwnvGxKCh5a6Gxqz3_fJFv8qkQ",
    "https://fastly.picsum.photos/id/940/400/400.jpg?hmac=-2sTA1minw9QpqhwlBkLG_EBiADfH09BPU_VwY2fwVk",
    "https://fastly.picsum.photos/id/757/400/400.jpg?hmac=eI31C3SciqTt5v7CpCFNvKREavuTOUPbcw0-vBS576A",
    "https://fastly.picsum.photos/id/478/400/400.jpg?hmac=913YXqx2-jF8opld3-WHcGq1djFXQk5WMSOlJR4jXo0",
    "https://fastly.picsum.photos/id/670/400/400.jpg?hmac=HYybLQYwTT1ci14shwpLCkn6OJIATpmcBct9fr_LCOU",
    "https://fastly.picsum.photos/id/1053/400/400.jpg?hmac=9Rtfp9BKF1mABZccE3R0Bik8zgc5de1FdZ37nC13VZo"
  ]
}
