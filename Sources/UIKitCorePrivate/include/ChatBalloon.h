#ifndef UIKitCorePrivateChatBalloon_h
#define UIKitCorePrivateChatBalloon_h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN UIView * _Nullable UIKitCorePrivateChatBalloonCreate(void)
  NS_SWIFT_NAME(makeChatBalloon());

UIKIT_EXTERN void UIKitCorePrivateChatBalloonConfigure(UIView *view, BOOL outgoing, BOOL hasTail, CGFloat radius, UIColor *fill)
  NS_SWIFT_NAME(configureChatBalloon(_:outgoing:hasTail:radius:fill:));

UIKIT_EXTERN void UIKitCorePrivateChatBalloonPrepare(UIView *view)
  NS_SWIFT_NAME(prepareChatBalloon(_:));

UIKIT_EXTERN UIBezierPath * _Nullable UIKitCorePrivateChatBalloonPreviewPath(UIView *view)
  NS_SWIFT_NAME(chatBalloonPreviewPath(_:));

NS_ASSUME_NONNULL_END

#endif
