// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AppLogic",
    platforms: [
      .macOS(.v13), .iOS(.v15)
    ],
    products: [
      .library(name: "Server", targets: ["Server"]),
      .library(name: "Client", targets: ["Client"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.70.0"),
        .package(url: "https://github.com/iwill/generic-json-swift.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "Server",
            dependencies: [
              .target(name: "Common"),
              .product(name: "Vapor", package: "vapor"),
              .product(name: "GenericJSON", package: "generic-json-swift")
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .target(name: "Common"),
        .target(name: "Client", dependencies: [
          .target(name: "Common")
        ]),
        .testTarget(name: "ServerTests", dependencies: [
            .target(name: "Server"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
