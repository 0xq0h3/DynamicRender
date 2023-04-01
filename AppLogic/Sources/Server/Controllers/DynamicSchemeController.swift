import Vapor

struct DynamicSchemeController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let schemes = routes.grouped("schemes")
    schemes.get(use: index)
  }

  func index(req: Request) throws -> DynamicSchemeResponse {
    let builder = SchemeBuilder()

    return DynamicSchemeResponse(
      ui: builder.buildSimpleScheme(imageURL: imageURLs[0], text: "Hello, World!")
//      ui: builder.buildFirstScheme(imageURLs: imageURLs, titles: titles, authors: authors)
//      ui: builder.buildSecondScheme(imageURLs: imageURLs, titles: titles, authors: authors)
    )
  }

  private let titles = [
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

  private let authors = [
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

  private let imageURLs = [
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
