#ifndef UIKitCorePrivateUIViewGlass_h
#define UIKitCorePrivateUIViewGlass_h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// The UIKit runtime class is _UIViewGlass.
NS_SWIFT_NAME(UIViewGlassMaterial)
@protocol UIKitCorePrivateGlassMaterial <NSObject>
@property (nonatomic, readonly) NSInteger variant;
@property (nonatomic, copy, nullable) NSString *subvariant;
@property (nonatomic) CGFloat smoothness;
@property (nonatomic, strong, nullable) UIColor *tintColor;
@property (nonatomic) BOOL flexible;

- (void)setAdaptive:(BOOL)adaptive;
@end

UIKIT_EXTERN id<UIKitCorePrivateGlassMaterial> _Nullable UIKitCorePrivateGlassMaterialCreate(NSInteger variant)
  NS_SWIFT_NAME(makeViewGlassMaterial(variant:));

@interface UIGlassEffect (UIKitCorePrivate)
+ (instancetype)effectWithGlass:(id<UIKitCorePrivateGlassMaterial>)glass;
@end

@interface UIView (UIKitCorePrivate)
- (void)_setGlassEffect:(nullable UIGlassEffect *)effect;
@end

NS_ASSUME_NONNULL_END

#endif
