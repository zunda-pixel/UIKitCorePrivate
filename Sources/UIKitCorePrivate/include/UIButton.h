#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIKitCorePrivateSourceMenuButton : UIButton
@property(nonatomic, weak, nullable) UIView *accessibilityReferenceView;
@end

UIKitCorePrivateSourceMenuButton *UIKitCorePrivateSourceMenuButtonCreate(void)
  NS_SWIFT_NAME(makeSourceMenuButton());

NS_ASSUME_NONNULL_END
