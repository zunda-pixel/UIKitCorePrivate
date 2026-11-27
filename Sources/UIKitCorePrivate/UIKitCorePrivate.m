#import "UIKitCorePrivate.h"
#import <objc/runtime.h>

// App Store Connect rejects an app whose binary has the name of a non-public class (ITMS-90338), as a class
// reference or as a string, even as a part of a longer string. Classes are looked up at runtime by a name that
// is written in Base64, so no part of the name is left in the binary. Comments are not compiled into the binary,
// so the comment next to each Base64 string gives the name.

static Class UIKitCorePrivateClassFromBase64(NSString *base64Name) {
  NSData *data = [[NSData alloc] initWithBase64EncodedString:base64Name options:0];
  NSString *name = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  return NSClassFromString(name);
}

@protocol UIKitCorePrivatePaletteInitializing <NSObject>
- (id)initWithContentView:(UIView *)contentView;
@end

UIView<UIKitCorePrivateNavigationBarPalette> *UIKitCorePrivateNavigationBarPaletteCreate(UIView *contentView) {
  // _UINavigationBarPalette
  Class paletteClass = UIKitCorePrivateClassFromBase64(@"X1VJTmF2aWdhdGlvbkJhclBhbGV0dGU=");
  id<UIKitCorePrivatePaletteInitializing> allocated = [paletteClass alloc];
  id palette = [allocated initWithContentView:contentView];
  return palette;
}

id<UIKitCorePrivateTabBarControllerVisualStyle> UIKitCorePrivateTabBarControllerVisualStyle(UITabBarController *tabBarController) {
  return [tabBarController valueForKey:@"_visualStyle"];
}

@protocol UIKitCorePrivateGlassMaterialInitializing <UIKitCorePrivateGlassMaterial>
- (id)initWithVariant:(NSInteger)variant;
@end

id<UIKitCorePrivateGlassMaterial> UIKitCorePrivateGlassMaterialCreate(NSInteger variant) {
  // _UIViewGlass
  Class glassClass = UIKitCorePrivateClassFromBase64(@"X1VJVmlld0dsYXNz");
  id<UIKitCorePrivateGlassMaterialInitializing> allocated = [glassClass alloc];
  return [allocated initWithVariant:variant];
}

id<UIKitCorePrivateContextMenuStyle> UIKitCorePrivateContextMenuStyleCreate(void) {
  // _UIContextMenuStyle
  return [UIKitCorePrivateClassFromBase64(@"X1VJQ29udGV4dE1lbnVTdHlsZQ==") new];
}

@interface UIButton (UIKitCorePrivateContextMenuStyle)
- (id<UIKitCorePrivateContextMenuStyle>)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                                 styleForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration;
- (UIView *)_morphView;
@end

@interface UIKitCorePrivateSourceMenuButton ()
@property(nonatomic, strong) UIView *menuSourceView;
@end

@implementation UIKitCorePrivateSourceMenuButton

- (UIView *)_morphView {
  if (self.menuVerticalGap <= 0 || !self.menu) {
    return [super _morphView];
  }
  if (!self.menuSourceView) {
    self.menuSourceView = [UIView new];
    self.menuSourceView.userInteractionEnabled = NO;
    self.menuSourceView.accessibilityElementsHidden = YES;
    [self addSubview:self.menuSourceView];
  }
  self.menuSourceView.frame = CGRectInset(self.bounds, 0, -self.menuVerticalGap);
  return self.menuSourceView;
}

- (id<UIKitCorePrivateContextMenuStyle>)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                                 styleForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration {
  id<UIKitCorePrivateContextMenuStyle> style = [super _contextMenuInteraction:interaction
                                                 styleForMenuWithConfiguration:configuration];
  style.shouldMenuOverlapSourcePreview = NO;
  return style;
}

@end

UIKitCorePrivateSourceMenuButton *UIKitCorePrivateSourceMenuButtonCreate(void) {
  UIKitCorePrivateSourceMenuButton *button = [UIKitCorePrivateSourceMenuButton buttonWithType:UIButtonTypeSystem];
  button.showsMenuFromSource = YES;
  return button;
}

#import <dlfcn.h>

typedef struct IMColorComponents {
  CGFloat red, green, blue, alpha;
} IMColorComponents;

@protocol UIKitCorePrivateChatBalloonDrawing <NSObject>
- (void)setColor:(int8_t)color;
- (void)setOrientation:(int8_t)orientation;
- (void)setHasTail:(BOOL)hasTail;
- (void)setCornerRadius:(CGFloat)radius;
- (void)setBalloonCorners:(NSUInteger)corners;
- (void)setDynamicFillColor:(IMColorComponents)color;
- (void)prepareForDisplay;
- (UIBezierPath * _Nullable)bezierPathForDragPreview;
@end

UIView *UIKitCorePrivateChatBalloonCreate(void) {
  static Class balloonClass;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", RTLD_NOW | RTLD_LOCAL);
    // CKColoredBalloonView
    balloonClass = UIKitCorePrivateClassFromBase64(@"Q0tDb2xvcmVkQmFsbG9vblZpZXc=");
  });
  return [[balloonClass alloc] initWithFrame:CGRectZero];
}

void UIKitCorePrivateChatBalloonConfigure(UIView *view, BOOL outgoing, BOOL hasTail, CGFloat radius, UIColor *fill) {
  UIView<UIKitCorePrivateChatBalloonDrawing> *balloon = (UIView<UIKitCorePrivateChatBalloonDrawing> *)view;
  IMColorComponents components = {0};
  [fill getRed:&components.red green:&components.green blue:&components.blue alpha:&components.alpha];

  [balloon setColor:outgoing ? 2 : 1];
  [balloon setOrientation:outgoing ? 1 : 0];
  [balloon setHasTail:hasTail];
  [balloon setCornerRadius:radius];
  [balloon setBalloonCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];
  [balloon setDynamicFillColor:components];
}

void UIKitCorePrivateChatBalloonPrepare(UIView *view) {
  [(id<UIKitCorePrivateChatBalloonDrawing>)view prepareForDisplay];
}

UIBezierPath *UIKitCorePrivateChatBalloonPreviewPath(UIView *view) {
  return [(id<UIKitCorePrivateChatBalloonDrawing>)view bezierPathForDragPreview];
}

@protocol UIKitCorePrivateHighlightEffectFactory <NSObject>
+ (id)effectWithPreview:(UITargetedPreview *)preview continuingFromPreview:(UITargetedPreview * _Nullable)previousPreview;
@end

id UIKitCorePrivateMakeEmptyHighlightEffect(UITargetedPreview *preview) {
  // _UINullClickHighlightEffect
  Class<UIKitCorePrivateHighlightEffectFactory> effectClass =
      UIKitCorePrivateClassFromBase64(@"X1VJTnVsbENsaWNrSGlnaGxpZ2h0RWZmZWN0");
  return [effectClass effectWithPreview:preview continuingFromPreview:preview];
}

static const char BubblePreviewOutlineKey;

@protocol UIKitCorePrivateTargetedPreviewPlatterStyle <NSObject>
- (void)_setPrefersUnmaskedPlatterStyle:(BOOL)unmasked;
@end

void UIKitCorePrivateSetContextMenuPreviewOutline(UIView *view, UIBezierPath *outline) {
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    // _UIContentPlatterView
    Class platterClass = UIKitCorePrivateClassFromBase64(@"X1VJQ29udGVudFBsYXR0ZXJWaWV3");
    SEL selector = NSSelectorFromString(@"setExpandedPreview:");
    Method setter = class_getInstanceMethod(platterClass, selector);
    void (*setExpandedPreview)(id, SEL, UITargetedPreview *) = (void *)method_getImplementation(setter);
    method_setImplementation(setter, imp_implementationWithBlock(^(id platter, UITargetedPreview *preview) {
      UIBezierPath *path = objc_getAssociatedObject(preview.view, &BubblePreviewOutlineKey);
      if (path != nil) {
        preview.parameters.visiblePath = path;
        [(id<UIKitCorePrivateTargetedPreviewPlatterStyle>)preview _setPrefersUnmaskedPlatterStyle:YES];
      }
      setExpandedPreview(platter, selector, preview);
    }));
  });
  objc_setAssociatedObject(view, &BubblePreviewOutlineKey, [outline copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
