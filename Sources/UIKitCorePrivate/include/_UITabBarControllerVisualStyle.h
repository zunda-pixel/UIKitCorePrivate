//
//   Declared from the Objective-C runtime of iOS 27.3 (Simulator).
//
#ifndef _UITabBarControllerVisualStyle_h
#define _UITabBarControllerVisualStyle_h
@import Foundation;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// The configuration of `_UITabBarControllerAdaptiveVisualStyle`.
@protocol _UITabBarControllerAdaptiveConfiguration <NSObject>

@property (nonatomic) BOOL supportsOverlaySidebarMode;

@end

/// `_UITabBarControllerVisualStyle`, the class of the `_visualStyle` instance variable of `UITabBarController`.
///
/// It is declared as a protocol, not as a class. Referencing a non-public class from an app is rejected by
/// App Store Connect (ITMS-90338: Non-public API usage).
@protocol _UITabBarControllerVisualStyle <NSObject>

- (BOOL)canDisplaySidebar;
- (BOOL)isDisplayingSidebar;
- (void)sidebarLayoutDidChange;
- (void)sidebarVisibilityDidChange;

/// The following are implemented only by `_UITabBarControllerAdaptiveVisualStyle`, the style of a tab bar controller
/// whose `mode` is `UITabBarControllerModeTabSidebar` on iPad.
@property (nonatomic, readonly, nullable) id<_UITabBarControllerAdaptiveConfiguration> configuration;
- (void)_setNeedsContentLayout;
- (void)_updateContentLayoutForSidebarAppearanceIfNeeded;

@end

/// Returns the `_visualStyle` instance variable of `tabBarController`.
UIKIT_EXTERN id<_UITabBarControllerVisualStyle> _Nullable UIKitCorePrivateTabBarControllerVisualStyle(
  UITabBarController *tabBarController)
  NS_SWIFT_NAME(visualStyle(of:));

NS_ASSUME_NONNULL_END

#endif /* _UITabBarControllerVisualStyle_h */
