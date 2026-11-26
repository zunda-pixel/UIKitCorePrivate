#if os(iOS)
  import SwiftUI
  import UIKit
  import UIKitCorePrivate

  @available(iOS 26.0, *)
  #Preview("Restore Tab Bar on Scroll Up") {
    makeTabBarScrollExample()
  }

  @available(iOS 26.0, *)
  @MainActor
  func makeTabBarScrollExample() -> UITabBarController {
    let rows = ScrollRows(style: .plain)
    rows.tabBarItem = UITabBarItem(title: "Rows", image: UIImage(systemName: "list.bullet"), tag: 0)

    let other = UIViewController()
    other.view.backgroundColor = .systemBackground
    other.tabBarItem = UITabBarItem(title: "Other", image: UIImage(systemName: "square"), tag: 1)

    let tabs = UITabBarController()
    tabs.viewControllers = [rows, other]
    tabs.tabBarMinimizeBehavior = .onScrollDown
    return tabs
  }

  @available(iOS 26.0, *)
  @MainActor
  private final class ScrollRows: UITableViewController {
    private var dragStartY: CGFloat?

    override func viewDidLoad() {
      super.viewDidLoad()
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Row")
      setContentScrollView(tableView, for: .bottom)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      100
    }

    override func tableView(
      _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Row", for: indexPath)
      var content = cell.defaultContentConfiguration()
      content.text = "Row \(indexPath.row + 1)"
      cell.contentConfiguration = content
      return cell
    }

    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
      dragStartY = scrollView.contentOffset.y
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
      guard scrollView.isDragging,
        let dragStartY,
        dragStartY - scrollView.contentOffset.y >= 16,
        let tabBar = tabBarController?.tabBar
      else { return }

      self.dragStartY = nil
      let interaction = tabBar.interactions
        .compactMap { $0 as? NSObject }
        .first { NSStringFromClass(type(of: $0)).hasSuffix("ScrollAwayInteraction") }

      // Reuse UIKit's scroll-to-top animation while keeping the current scroll position.
      _ = interaction?._observeScrollViewWillScroll(toTop: scrollView)
    }
  }
#endif
