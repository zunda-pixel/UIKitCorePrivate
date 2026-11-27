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

UIKIT_EXTERN void UIKitCorePrivateUseUnmaskedPreview(UITargetedPreview *preview)
  NS_SWIFT_NAME(useUnmaskedContextMenuPreview(_:));

@protocol UIKitCorePrivateContextMenuInteractionDelegate <UIContextMenuInteractionDelegate>
- (id<UIKitCorePrivateContextMenuStyle>)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                                 styleForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration
  NS_SWIFT_NAME(contextMenuInteraction(_:styleForMenuWith:));
@optional
- (nullable id)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                          configuration:(UIContextMenuConfiguration *)configuration
    interactionEffectForTargetedPreview:(UITargetedPreview *)preview
  NS_SWIFT_NAME(contextMenuInteraction(_:configuration:interactionEffectFor:));
@end

NS_ASSUME_NONNULL_END

#endif
