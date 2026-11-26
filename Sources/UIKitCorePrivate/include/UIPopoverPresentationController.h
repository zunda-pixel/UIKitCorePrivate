#ifndef UIKitCorePrivateUIPopoverPresentationController_h
#define UIKitCorePrivateUIPopoverPresentationController_h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIPresentationController (UIKitCorePrivate)
- (void)setBackgroundEffect:(nullable UIVisualEffect *)effect;
@end

@interface UIPopoverPresentationController (UIKitCorePrivate)
- (void)_setShouldHideArrow:(BOOL)hideArrow;
@end

NS_ASSUME_NONNULL_END

#endif
