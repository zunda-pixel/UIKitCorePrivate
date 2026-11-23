//
//   Declared from the Objective-C runtime of iOS 27.3 (Simulator).
//
#ifndef _UIScrollAwayInteraction_h
#define _UIScrollAwayInteraction_h
@import Foundation;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// Methods of `UIKit._UIScrollAwayInteraction`, the interaction that minimizes a bar (the tab bar) while scrolling.
/// The class is written in Swift and has no Objective-C class symbol, so its methods are declared on NSObject.
/// Check the class name and respondsToSelector: before calling.
@interface NSObject (_UIScrollAwayInteraction)

- (void)_observeScrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)_observeScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)_observeScrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)_observeScrollViewDidEndDecelerating:(UIScrollView *)scrollView;
- (BOOL)_observeScrollViewWillScrollToTop:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END

#endif /* _UIScrollAwayInteraction_h */
