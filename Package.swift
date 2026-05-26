// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "UIKitCorePrivate",
  products: [
    .library(
      name: "UIKitCorePrivate",
      targets: ["UIKitCorePrivate"]
    ),
  ],
  targets: [
    .target(
      name: "UIKitCorePrivate"
    ),
    .testTarget(
      name: "UIKitCorePrivateTests",
      dependencies: ["UIKitCorePrivate"]
    ),
  ]
)
