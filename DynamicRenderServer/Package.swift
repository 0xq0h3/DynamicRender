// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "DynamicRenderServer",
    platforms: [
      .macOS(.v13), .iOS(.v15)
    ],
    dependencies: [
      .package(name: "AppLogic", path: "../AppLogic/")
    ],
    targets: [
      .executableTarget(name: "Run", dependencies: [
        .product(name: "Server", package: "AppLogic")
      ]),
    ]
)
