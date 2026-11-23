@import Foundation;
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (UIKitCorePrivate)

/// ステータスバーを押したときと同じく、先頭へスクロールする。動き始めたら YES。
- (BOOL)_scrollToTopIfPossible:(BOOL)animated;

/// `animation` (CASpringAnimation など) の動きで、`contentOffset` へスクロールする。
- (void)_setContentOffset:(CGPoint)contentOffset
                 animated:(BOOL)animated
           animationCurve:(int)animationCurve
animationAdjustsForContentOffsetDelta:(BOOL)adjustsForContentOffsetDelta
                animation:(nullable CAAnimation *)animation;

/// 自前のアニメーションでスクロールしている途中か。
@property (nonatomic, readonly) BOOL _isAnimatingScroll;

@end

NS_ASSUME_NONNULL_END
