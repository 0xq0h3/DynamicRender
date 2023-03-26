import Fluent
import Vapor

struct DynamicSchemeController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let schemes = routes.grouped("schemes")
    schemes.get(use: index)
  }

  func index(req: Request) throws -> DynamicSchemeResponse {
    let builder = SchemeBuilder()

    return DynamicSchemeResponse(
      ui: builder.buildImageScheme()
//      ui: builder.buildFirstScheme()
//      ui: builder.buildSecondScheme()
    )
  }
}
