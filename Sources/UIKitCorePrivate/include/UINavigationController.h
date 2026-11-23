#include "_UINavigationBarPalette.h"
@import Foundation;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (UIViewController)

- (void)attachPalette:(UIView<_UINavigationBarPalette> *)palette isPinned:(BOOL)pinned;

@end

NS_ASSUME_NONNULL_END
