import UIKit

@available(iOS 18.0, *)
final class DummyCollectionViewController: UICollectionViewController {
  private typealias DataSource = UICollectionViewDiffableDataSource<Sections, Item.ID>
  private typealias CellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item>
  
  @ViewLoading private var repository: Repository
  @ViewLoading private var dataSource: DataSource
  
  init() {
    super.init(collectionViewLayout: .init())
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionView.collectionViewLayout = makeCollectionLayout()
    self.title = "Title"
    
    self.repository = Repository()
    self.dataSource = makeDataSource(for: self.collectionView)
    
    Task {
      await initialSnapshot()
    }
  }
  
  private func makeCollectionLayout() -> UICollectionViewLayout {
    // 標準で用意されているLayoutを使用
    let listConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    let layout: UICollectionViewCompositionalLayout = .list(using: listConfig)
    return layout
  }
  
  private func makeCellRegistration() -> CellRegistration {
    return CellRegistration { cell, _, item in
      var contentConfig = cell.defaultContentConfiguration()
      contentConfig.text = item.title
      cell.contentConfiguration = contentConfig
      
      // 選択したときに背景色が変わってしまうのを固定にして対応
      var backgroundConfiguration: UIBackgroundConfiguration = .listCell()
      backgroundConfiguration.backgroundColorTransformer = .init( { _ in
        return .secondarySystemGroupedBackground
      })
      cell.backgroundConfiguration = backgroundConfiguration
    }
  }
  
  private func makeDataSource(for collectionView: UICollectionView) -> DataSource {
    // 各セルに渡されるitem(SettingItem)を使ってUICollectionViewListCellを設定
    let cellRegistration = makeCellRegistration()
    
    let dataSource = DataSource(collectionView: collectionView) { [weak repository] collectionView, indexPath, id in
      guard let repository else { return nil }
      let item = repository.items.first { $0.id == id }!
      return collectionView.dequeueConfiguredReusableCell(
        using: cellRegistration,
        for: indexPath,
        item: item
      )
    }
                
    return dataSource
  }
  
  private func initialSnapshot() async {
    var snapshot = self.dataSource.snapshot()
    snapshot.appendSections(Sections.allCases)
                                  
    let ids = self.repository.items.map(\.id)
    snapshot.appendItems(ids, toSection: .default)
    
    await self.dataSource.apply(snapshot, animatingDifferences: true)
  }
}

@available(iOS 18.0, *)
#Preview {
  UINavigationController(rootViewController: DummyCollectionViewController())
}

@available(iOS 18.0, *)
extension DummyCollectionViewController {
  final class Repository {
    var items: [Item] = [
      .init(title: "AirPlane Mode"),
      .init(title: "Wi-Fi"),
      .init(title: "Bluetooth"),
      .init(title: "Mobile Network"),
      .init(title: "Sharing Network"),
      .init(title: "Notification"),
      .init(title: "Sound and Feedback"),
      .init(title: "Focus Mode"),
      .init(title: "Screen Time")
    ]
  }
  
  enum Sections: Sendable, Hashable, CaseIterable {
    case `default`
  }
  
  struct Item: Hashable, Identifiable, Sendable {
    var id: UUID = UUID()
    var title: String
  }
}
