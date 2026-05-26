// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "UIKitCorePrivate",
  products: [
    .library(
      name: "UIKitCorePrivate",
      targets: ["UIKitCorePrivate"]
    ),
    .library(
      name: "Example",
      targets: ["Example"]
    ),
  ],
  targets: [
    .target(
      name: "UIKitCorePrivate"
    ),
    .target(
      name: "Example",
      dependencies: ["UIKitCorePrivate"]
    ),
  ]
)
