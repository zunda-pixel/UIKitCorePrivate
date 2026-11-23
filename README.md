# UIKitCorePrivate

Swift Package that exposes private UIKit (UIKitCore) declarations, such as the navigation bar palette, so they can be used from Swift.

> [!WARNING]
> These are private APIs. They may change or disappear in any iOS release, and apps using them may be rejected from the App Store.

App Store Connect rejects an app whose binary has the name of a non-public class, as a class reference or as a string (ITMS-90338: Non-public API usage). So non-public classes are not declared with `@interface`:

- A class is declared as a protocol whose name differs from the class (`NavigationBarPalette`, `TabBarControllerVisualStyle`).
- An instance is created or read by a function that looks up the class or the instance variable at runtime (`makeNavigationBarPalette(contentView:)`, `visualStyle(of:)`). A class name is written in Base64, with the name in a comment next to it.
- Methods of public classes are declared in categories.

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

let palette = makeNavigationBarPalette(contentView: segmentedControl)!
palette.preferredHeight = 44
viewController.navigationItem._bottomPalette = palette
```

See [`Sources/Example`](Sources/Example) for more examples (SwiftUI previews).

## License

[Apache License 2.0](LICENSE)
