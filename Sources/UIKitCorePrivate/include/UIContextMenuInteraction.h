#ifndef UIKitCorePrivateUIContextMenuInteraction_h
#define UIKitCorePrivateUIContextMenuInteraction_h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, UIKitCorePrivateContextMenuLayout) {
  UIKitCorePrivateContextMenuLayoutAutomatic = 0,
} NS_SWIFT_NAME(ContextMenuLayout);

// The UIKit runtime class is _UIContextMenuStyle.
NS_SWIFT_NAME(ContextMenuStyle)
@protocol UIKitCorePrivateContextMenuStyle <NSObject>
@property (nonatomic) UIKitCorePrivateContextMenuLayout preferredLayout;
@property (nonatomic) BOOL shouldMenuOverlapSourcePreview;
@end

UIKIT_EXTERN id<UIKitCorePrivateContextMenuStyle> UIKitCorePrivateContextMenuStyleCreate(void)
  NS_SWIFT_NAME(makeContextMenuStyle());

UIKIT_EXTERN id UIKitCorePrivateMakeEmptyHighlightEffect(UITargetedPreview *preview)
  NS_SWIFT_NAME(makeEmptyContextMenuHighlightEffect(_:));

UIKIT_EXTERN void UIKitCorePrivateSetContextMenuPreviewOutline(UIView *view, UIBezierPath *outline)
  NS_SWIFT_NAME(setContextMenuPreviewOutline(_:outline:));

// Both methods are optional: implementing the style method makes UIKit use the returned style
// instead of its default one, so delegates that only need the highlight effect must omit it.
@protocol UIKitCorePrivateContextMenuInteractionDelegate <UIContextMenuInteractionDelegate>
@optional
- (id<UIKitCorePrivateContextMenuStyle>)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                                 styleForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration
  NS_SWIFT_NAME(contextMenuInteraction(_:styleForMenuWith:));
- (nullable id)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                          configuration:(UIContextMenuConfiguration *)configuration
    interactionEffectForTargetedPreview:(UITargetedPreview *)preview
  NS_SWIFT_NAME(contextMenuInteraction(_:configuration:interactionEffectFor:));
@end

NS_ASSUME_NONNULL_END

#endif
