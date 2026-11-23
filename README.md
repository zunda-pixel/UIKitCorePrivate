# UIKitCorePrivate

Swift Package that exposes private UIKit (UIKitCore) declarations, such as `_UINavigationBarPalette`, so they can be used from Swift.

> [!WARNING]
> These are private APIs. They may change or disappear in any iOS release, and apps using them may be rejected from the App Store. Check availability (e.g. `NSClassFromString`) before use.

## Installation

```swift
dependencies: [
  .package(url: "https://github.com/zunda-pixel/UIKitCorePrivate", from: "0.0.1"),
],
targets: [
  .target(
    name: "YourTarget",
    dependencies: ["UIKitCorePrivate"]
  ),
]
```

## Usage

```swift
import UIKit
import UIKitCorePrivate

let palette = _UINavigationBarPalette(contentView: segmentedControl)!
palette.preferredHeight = 44
viewController.navigationItem._bottomPalette = palette
```

See [`Sources/Example`](Sources/Example) for more examples (SwiftUI previews).

## License

[Apache License 2.0](LICENSE)
