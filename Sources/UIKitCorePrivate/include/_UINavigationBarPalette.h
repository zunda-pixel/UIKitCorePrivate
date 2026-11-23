//
//   Declared from the Objective-C runtime of iOS 27.3 (Simulator).
//
#ifndef _UINavigationBarPalette_h
#define _UINavigationBarPalette_h
@import Foundation;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// `_UINavigationBarPalette`, a view shown below (or above) the navigation bar.
///
/// It is declared as a protocol, not as a class. Referencing a non-public class from an app
/// (a class reference such as `_OBJC_CLASS_$__UINavigationBarPalette`) is rejected by App Store Connect
/// (ITMS-90338: Non-public API usage). Create one with `UIKitCorePrivateNavigationBarPaletteCreate`.
@protocol _UINavigationBarPalette <NSObject>

@property (readonly, nonatomic) UIView *contentView;
@property (nonatomic) double preferredHeight;
@property (nonatomic) double minimumHeight;
@property (nonatomic, getter=isPinned) BOOL pinned;
@property (nonatomic, setter=_setDisplaysWhenSearchActive:) BOOL _displaysWhenSearchActive;
@property (nonatomic, setter=_setContentViewMarginType:) unsigned long long _contentViewMarginType;
@property (nonatomic, setter=_setLayoutPriority:) long long _layoutPriority;

@end

/// Creates `_UINavigationBarPalette` with `contentView`, looking up the class by name.
/// Returns nil if the class does not exist.
UIKIT_EXTERN UIView<_UINavigationBarPalette> *_Nullable UIKitCorePrivateNavigationBarPaletteCreate(UIView *contentView)
  NS_SWIFT_NAME(makeNavigationBarPalette(contentView:));

NS_ASSUME_NONNULL_END

#endif /* _UINavigationBarPalette_h */
