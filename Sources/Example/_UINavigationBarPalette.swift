import UIKitCorePrivate
import SwiftUI

// Not work: _UINavigationBarPalette.pinned
// Same: UINavigationController.attachPalette() == set _UINavigationBarPalette._bottomPalette

@available(iOS 18.0, *)
#Preview("Bottom Palette") {
  let vc = DummyCollectionViewController()
  let palette = _UINavigationBarPalette(contentView: DummySegmentControl())!
  palette.preferredHeight = 44
  vc.navigationItem._bottomPalette = palette
  return UINavigationController(rootViewController: vc)
}

@available(iOS 18.0, *)
#Preview("Top Palette") {
  let vc = DummyCollectionViewController()
  let palette = _UINavigationBarPalette(contentView: DummySegmentControl())!
  palette.preferredHeight = 44
  vc.navigationItem._topPalette = palette
  return UINavigationController(rootViewController: vc)
}

@available(iOS 18.0, *)
#Preview("Bottom & Top Palette") {
  let vc = DummyCollectionViewController()
  
  let topPalette = _UINavigationBarPalette(contentView: DummySegmentControl())!
  topPalette.preferredHeight = 44
  vc.navigationItem._topPalette = topPalette

  let bottomPalette = _UINavigationBarPalette(contentView: DummySegmentControl())!
  bottomPalette.preferredHeight = 44
  vc.navigationItem._bottomPalette = bottomPalette
  
  return UINavigationController(rootViewController: vc)
}

@available(iOS 18.0, *)
#Preview("Bottom Palette minHeight") {
  let vc = DummyCollectionViewController()
  let label = UILabel()
  label.text = "This is a long long long long long long long long long label"
  label.textColor = .white
  label.backgroundColor = .red
  
  let palette = _UINavigationBarPalette(contentView: label)!
  palette.preferredHeight = 44
  palette.minimumHeight = 0
  vc.navigationItem._bottomPalette = palette
  return UINavigationController(rootViewController: vc)
}

@available(iOS 18.0, *)
#Preview("Bottom Palette & SearchBar") {
  let vc = DummyCollectionViewController()
  vc.collectionView.contentInset.top = 10
  vc.navigationItem.searchController = UISearchController(searchResultsController: nil)
  vc.navigationItem.preferredSearchBarPlacement = .stacked
  let palette = _UINavigationBarPalette(contentView: DummySegmentControl())!
  palette.preferredHeight = 44
  vc.navigationItem._bottomPalette = palette
  return UINavigationController(rootViewController: vc)
}

//@available(iOS 18.0, *)
//#Preview("Bottom Palette & SearchBar & hidesWhenSearchActive") {
//  let vc = DummyCollectionViewController()
//  vc.collectionView.contentInset.top = 5
//  vc.navigationItem.searchController = UISearchController(searchResultsController: nil)
//  vc.navigationItem.preferredSearchBarPlacement = .stacked
//  let palette = _UINavigationBarPalette(contentView: DummySegmentControl())!
//  palette.preferredHeight = 44
////  palette._displaysWhenSearchActive = false
//  vc.navigationItem._bottomPalette = palette
//  return UINavigationController(rootViewController: vc)
//}

// NavigationBar.attachPalette == navigationItem._bottomPalette
@available(iOS 18.0, *)
#Preview("NavigationBar.attachPalette") {
  {
    let vc = DummyCollectionViewController()
    let palette = _UINavigationBarPalette(contentView: DummySegmentControl())!
    palette.preferredHeight = 44
    let navigationController = UINavigationController(rootViewController: vc)
    navigationController.attachPalette(palette, isPinned: true)
    
    return navigationController
  }()
}
