#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_UI_ACTOR
@protocol UIKitCorePrivateTranscriptHosting <NSObject>
@property(nonatomic, readonly) UICollectionView *collectionView;
@property(nonatomic, weak, nullable) id<UICollectionViewDelegate> hostedDelegate;
@property(nonatomic, copy) NSArray<NSValue *> *rowSizes;
@end

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN __kindof UIViewController<UIKitCorePrivateTranscriptHosting> * _Nullable
UIKitCorePrivateTranscriptCreate(void) NS_SWIFT_NAME(makeChatTranscript());

NS_SWIFT_UI_ACTOR
UIKIT_EXTERN void UIKitCorePrivateTranscriptUpdateOffset(UICollectionView *collectionView, void (^updates)(void))
  NS_SWIFT_NAME(updateChatTranscriptOffset(_:updates:));

NS_ASSUME_NONNULL_END
