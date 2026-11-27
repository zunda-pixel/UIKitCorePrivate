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

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN UIView * _Nullable UIKitCorePrivateTextBalloonCreate(void) NS_SWIFT_NAME(makeChatTextBalloon());

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN void UIKitCorePrivateTextBalloonSetText(UIView *view, NSAttributedString *text)
  NS_SWIFT_NAME(setChatTextBalloonText(_:text:));

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN CGSize UIKitCorePrivateTextBalloonMeasure(UIView *view, CGFloat width)
  NS_SWIFT_NAME(measureChatTextBalloon(_:width:));

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN UIView * _Nullable UIKitCorePrivateImageBalloonCreate(void) NS_SWIFT_NAME(makeChatImageBalloon());

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN void UIKitCorePrivateImageBalloonSetImage(UIView *view, UIImage *image)
  NS_SWIFT_NAME(setChatImageBalloonImage(_:image:));

NS_SWIFT_UI_ACTOR
@protocol UIKitCorePrivateBalloonSwipeHandling <NSObject>
@property(nonatomic, readonly) UIView *replyIndicator;
- (void)setBalloonView:(UIView *)view;
- (void)swipeToReplyGestureHandler:(UIPanGestureRecognizer *)pan;
- (void)prepareForReuse;
@end

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN id<UIKitCorePrivateBalloonSwipeHandling> _Nullable UIKitCorePrivateBalloonSwipeCreate(
  UICollectionViewCell *cell, void (^completion)(CGFloat, CGPoint), void (^changed)(CGFloat))
  NS_SWIFT_NAME(makeChatBalloonSwipe(_:completion:changed:));

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN UIView *UIKitCorePrivateTapbackAccessoryCreate(
  NSString *identifier, BOOL outgoing, CGRect layoutBounds, void (^selected)(NSString *emoji)
) NS_SWIFT_NAME(makeChatTapbackAccessory(identifier:outgoing:layoutBounds:selected:));

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN void UIKitCorePrivateTapbackAccessorySetVisible(UIView *accessory, BOOL visible)
  NS_SWIFT_NAME(setChatTapbackAccessoryVisible(_:visible:));

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN void UIKitCorePrivateTapbackAccessoryAlign(UIView *accessory, CGFloat sourceX)
  NS_SWIFT_NAME(alignChatTapbackAccessory(_:sourceX:));

NS_ASSUME_NONNULL_END

#endif
