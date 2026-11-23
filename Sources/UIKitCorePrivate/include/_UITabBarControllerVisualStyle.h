//
//   Declared from the Objective-C runtime of iOS 27.3 (Simulator).
//
#ifndef _UITabBarControllerVisualStyle_h
#define _UITabBarControllerVisualStyle_h
@import Foundation;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// The configuration of the adaptive visual style (the style of a tab bar controller whose `mode` is
/// `UITabBarControllerModeTabSidebar` on iPad).
NS_SWIFT_NAME(TabBarControllerAdaptiveConfiguration)
@protocol UIKitCorePrivateTabBarControllerAdaptiveConfiguration <NSObject>

@property (nonatomic) BOOL supportsOverlaySidebarMode;

@end

/// The visual style of a tab bar controller, the `_visualStyle` instance variable of `UITabBarController`.
///
/// App Store Connect rejects an app whose binary has the name of a non-public class
/// (ITMS-90338: Non-public API usage), as a class reference or as a string. So the class is declared as a protocol
/// whose name differs from the class, and read with `UIKitCorePrivateTabBarControllerVisualStyle`.
NS_SWIFT_NAME(TabBarControllerVisualStyle)
@protocol UIKitCorePrivateTabBarControllerVisualStyle <NSObject>

- (BOOL)canDisplaySidebar;
- (BOOL)isDisplayingSidebar;
- (void)sidebarLayoutDidChange;
- (void)sidebarVisibilityDidChange;

/// The following are implemented only by the adaptive visual style, the style of a tab bar controller
/// whose `mode` is `UITabBarControllerModeTabSidebar` on iPad.
@property (nonatomic, readonly, nullable) id<UIKitCorePrivateTabBarControllerAdaptiveConfiguration> configuration;
- (void)_setNeedsContentLayout;
- (void)_updateContentLayoutForSidebarAppearanceIfNeeded;

@end

/// Returns the `_visualStyle` instance variable of `tabBarController`.
UIKIT_EXTERN id<UIKitCorePrivateTabBarControllerVisualStyle> _Nullable UIKitCorePrivateTabBarControllerVisualStyle(
  UITabBarController *tabBarController)
  NS_SWIFT_NAME(visualStyle(of:));

NS_ASSUME_NONNULL_END

#endif /* _UITabBarControllerVisualStyle_h */
