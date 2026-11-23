import SwiftUI

@available(iOS 13.0, *)
final class DummySegmentControl: UISegmentedControl {
  enum Segment: Int, CaseIterable {
    case first = 0
    case second = 1

    var label: String {
      switch self {
      case .first: "First"
      case .second: "Second"
      }
    }
  }

  var selectedSegment: Segment {
    Segment(rawValue: selectedSegmentIndex) ?? .first
  }

  init() {
    super.init(items: Segment.allCases.map(\.label))
    selectedSegmentIndex = Segment.first.rawValue
  }

  required init?(coder: NSCoder) {
    fatalError()
  }
}

@available(iOS 17.0, *)
#Preview {
  DummySegmentControl()
}
