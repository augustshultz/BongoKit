// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BongoKit",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "BongoKit",
      targets: ["BongoKit"])
  ],
  dependencies: [
    .package(url: "https://github.com/augustshultz/CommandKit.git", from: "0.2.1")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "BongoKit",
      dependencies: ["CommandKit"]),
    .testTarget(
      name: "BongoKitTests",
      dependencies: ["BongoKit"])
  ]
)
