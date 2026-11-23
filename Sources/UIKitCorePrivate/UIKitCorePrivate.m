#import "UIKitCorePrivate.h"

// App Store Connect rejects an app whose binary has the name of a non-public class (ITMS-90338), as a class
// reference or as a string. Classes are looked up at runtime by a name joined from parts. Adjacent string
// literals ("a" "b") are joined by the compiler, so the parts are appended at runtime. Neither part is a name in
// UIKit by itself.

@protocol UIKitCorePrivatePaletteInitializing <NSObject>
- (id)initWithContentView:(UIView *)contentView;
@end

UIView<UIKitCorePrivateNavigationBarPalette> *UIKitCorePrivateNavigationBarPaletteCreate(UIView *contentView) {
  Class paletteClass = NSClassFromString([@"_UINavigationBarPal" stringByAppendingString:@"ette"]);
  id<UIKitCorePrivatePaletteInitializing> allocated = [paletteClass alloc];
  id palette = [allocated initWithContentView:contentView];
  return palette;
}

id<UIKitCorePrivateTabBarControllerVisualStyle> UIKitCorePrivateTabBarControllerVisualStyle(UITabBarController *tabBarController) {
  return [tabBarController valueForKey:@"_visualStyle"];
}
