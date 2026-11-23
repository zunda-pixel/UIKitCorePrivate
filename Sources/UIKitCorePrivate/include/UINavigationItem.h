#include "_UINavigationBarPalette.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationItem (_UINavigationBarPaletteAdditions)

@property (nonatomic, strong, nullable, getter=_topPalette, setter=_setTopPalette:) UIView<UIKitCorePrivateNavigationBarPalette> *_topPalette;
@property (nonatomic, strong, nullable, getter=_bottomPalette, setter=_setBottomPalette:) UIView<UIKitCorePrivateNavigationBarPalette> *_bottomPalette;

@end

NS_ASSUME_NONNULL_END
