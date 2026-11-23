//
//   Declared from the Objective-C runtime of iOS 27.3 (Simulator).
//
#ifndef _UINavigationBarPalette_h
#define _UINavigationBarPalette_h
@import Foundation;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// The navigation bar palette, a view shown below (or above) the navigation bar.
///
/// App Store Connect rejects an app whose binary has the name of a non-public class
/// (ITMS-90338: Non-public API usage), as a class reference or as a string. So the class is declared as a protocol
/// whose name differs from the class, and created with `UIKitCorePrivateNavigationBarPaletteCreate`.
NS_SWIFT_NAME(NavigationBarPalette)
@protocol UIKitCorePrivateNavigationBarPalette <NSObject>

@property (readonly, nonatomic) UIView *contentView;
@property (nonatomic) double preferredHeight;
@property (nonatomic) double minimumHeight;
@property (nonatomic, getter=isPinned) BOOL pinned;
@property (nonatomic, setter=_setDisplaysWhenSearchActive:) BOOL _displaysWhenSearchActive;
@property (nonatomic, setter=_setContentViewMarginType:) unsigned long long _contentViewMarginType;
@property (nonatomic, setter=_setLayoutPriority:) long long _layoutPriority;

@end

/// Creates a navigation bar palette with `contentView`, looking up the class by name at runtime.
/// Returns nil if the class does not exist.
UIKIT_EXTERN UIView<UIKitCorePrivateNavigationBarPalette> *_Nullable UIKitCorePrivateNavigationBarPaletteCreate(UIView *contentView)
  NS_SWIFT_NAME(makeNavigationBarPalette(contentView:));

NS_ASSUME_NONNULL_END

#endif /* _UINavigationBarPalette_h */
