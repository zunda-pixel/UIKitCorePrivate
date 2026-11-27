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
@protocol UIKitCorePrivateBalloonSwipeHandling <NSObject>
@property(nonatomic, readonly) UIView *replyIndicator;
- (void)setBalloonView:(UIView *)view;
- (void)swipeToReplyGestureHandler:(UIPanGestureRecognizer *)pan;
- (void)prepareForReuse;
@end

UIKIT_EXTERN id<UIKitCorePrivateBalloonSwipeHandling> _Nullable UIKitCorePrivateBalloonSwipeCreate(
  UICollectionViewCell *cell, void (^completion)(CGFloat, CGPoint), void (^changed)(CGFloat))
  NS_SWIFT_NAME(makeChatBalloonSwipe(_:completion:changed:));

NS_ASSUME_NONNULL_END

#endif
