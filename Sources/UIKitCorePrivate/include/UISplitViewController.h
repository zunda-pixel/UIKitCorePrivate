#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISplitViewController (UIKitCorePrivate)

/// Shows the UIKit column separators, including their native resize gestures in tiled layouts.
- (void)_setShowsSeparators:(BOOL)showsSeparators;

@end

NS_ASSUME_NONNULL_END
