//
//   Declared from the Objective-C runtime of iOS 27.3 (Simulator).
//
#ifndef _UITabBarControllerVisualStyle_h
#define _UITabBarControllerVisualStyle_h
@import Foundation;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// The configuration of `_UITabBarControllerAdaptiveVisualStyle`.
/// `_UITabBarControllerAdaptiveConfiguration` is not exported, so it is declared as a protocol.
@protocol _UITabBarControllerAdaptiveConfiguration <NSObject>

@property (nonatomic) BOOL supportsOverlaySidebarMode;

@end

/// The class of the `_visualStyle` instance variable of `UITabBarController`.
/// weak_import: if a future OS removes the class, the app still launches.
UIKIT_EXTERN __attribute__((weak_import))
@interface _UITabBarControllerVisualStyle : NSObject

- (BOOL)canDisplaySidebar;
- (BOOL)isDisplayingSidebar;
- (void)sidebarLayoutDidChange;
- (void)sidebarVisibilityDidChange;

@end

/// Implemented only by `_UITabBarControllerAdaptiveVisualStyle` (a subclass that is not exported).
@interface _UITabBarControllerVisualStyle (_UITabBarControllerAdaptiveVisualStyle)

@property (nonatomic, readonly, nullable) id<_UITabBarControllerAdaptiveConfiguration> configuration;
- (void)_setNeedsContentLayout;
- (void)_updateContentLayoutForSidebarAppearanceIfNeeded;

@end

NS_ASSUME_NONNULL_END

#endif /* _UITabBarControllerVisualStyle_h */
