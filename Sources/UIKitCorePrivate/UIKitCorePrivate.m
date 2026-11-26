#import "UIKitCorePrivate.h"

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

@protocol UIKitCorePrivateContextMenuStyle <NSObject>
@property (nonatomic) BOOL shouldMenuOverlapSourcePreview;
@end

@interface UIButton (UIKitCorePrivateContextMenuStyle)
- (id<UIKitCorePrivateContextMenuStyle>)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                                 styleForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration;
@end

@interface UIKitCorePrivateSourceMenuButton : UIButton
@end

@implementation UIKitCorePrivateSourceMenuButton

- (id<UIKitCorePrivateContextMenuStyle>)_contextMenuInteraction:(UIContextMenuInteraction *)interaction
                                 styleForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration {
  id<UIKitCorePrivateContextMenuStyle> style = [super _contextMenuInteraction:interaction
                                                 styleForMenuWithConfiguration:configuration];
  style.shouldMenuOverlapSourcePreview = NO;
  return style;
}

@end

UIButton *UIKitCorePrivateSourceMenuButtonCreate(void) {
  UIButton *button = [UIKitCorePrivateSourceMenuButton buttonWithType:UIButtonTypeSystem];
  button.showsMenuFromSource = YES;
  return button;
}
