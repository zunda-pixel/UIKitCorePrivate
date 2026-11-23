#import "UIKitCorePrivate.h"

// Classes are looked up by name, so that the app has no reference to a non-public class (ITMS-90338).

@protocol _UINavigationBarPaletteInitializing <NSObject>
- (id)initWithContentView:(UIView *)contentView;
@end

UIView<_UINavigationBarPalette> *UIKitCorePrivateNavigationBarPaletteCreate(UIView *contentView) {
  Class paletteClass = NSClassFromString(@"_UINavigationBarPalette");
  id<_UINavigationBarPaletteInitializing> allocated = [paletteClass alloc];
  id palette = [allocated initWithContentView:contentView];
  return palette;
}

id<_UITabBarControllerVisualStyle> UIKitCorePrivateTabBarControllerVisualStyle(UITabBarController *tabBarController) {
  return [tabBarController valueForKey:@"_visualStyle"];
}
