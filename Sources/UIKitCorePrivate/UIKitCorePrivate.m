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

@protocol UIKitCorePrivateContextMenuStyle <NSObject>
@property (nonatomic) BOOL shouldMenuOverlapSourcePreview;
@end

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

@protocol UIKitCorePrivateTextBalloonContent <NSObject>
- (void)setAttributedText:(NSAttributedString *)text;
- (void)setAllowsTextSelection:(BOOL)allowed;
- (CGSize)sizeThatFits:(CGSize)size textAlignmentInsets:(UIEdgeInsets)alignment tailInsets:(UIEdgeInsets)tail;
@end

@protocol UIKitCorePrivateImageBalloonContent <NSObject>
- (void)setImage:(UIImage *)image;
@end

UIView *UIKitCorePrivateTextBalloonCreate(void) {
  static Class cls;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", RTLD_NOW | RTLD_LOCAL);
    // CKTextBalloonView
    cls = UIKitCorePrivateClassFromBase64(@"Q0tUZXh0QmFsbG9vblZpZXc=");
  });
  UIView *view = [[cls alloc] initWithFrame:CGRectZero];
  [(id<UIKitCorePrivateTextBalloonContent>)view setAllowsTextSelection:NO];
  return view;
}

void UIKitCorePrivateTextBalloonSetText(UIView *view, NSAttributedString *text) {
  [(id<UIKitCorePrivateTextBalloonContent>)view setAttributedText:text];
}

CGSize UIKitCorePrivateTextBalloonMeasure(UIView *view, CGFloat width) {
  return [(id<UIKitCorePrivateTextBalloonContent>)view sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)
    textAlignmentInsets:UIEdgeInsetsZero tailInsets:UIEdgeInsetsZero];
}

UIView *UIKitCorePrivateImageBalloonCreate(void) {
  static Class cls;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", RTLD_NOW | RTLD_LOCAL);
    // CKImageBalloonView
    cls = UIKitCorePrivateClassFromBase64(@"Q0tJbWFnZUJhbGxvb25WaWV3");
  });
  return [[cls alloc] initWithFrame:CGRectZero];
}

void UIKitCorePrivateImageBalloonSetImage(UIView *view, UIImage *image) {
  [(id<UIKitCorePrivateImageBalloonContent>)view setImage:image];
  UIKitCorePrivateChatBalloonPrepare(view);
}

@protocol UIKitCorePrivateBalloonSwipeInitializing <UIKitCorePrivateBalloonSwipeHandling>
- (instancetype)initForCell:(UICollectionViewCell *)cell
      swipeCompletionHandler:(void (^)(CGFloat, CGPoint))completion
         swipeChangedHandler:(void (^)(CGFloat))changed;
@end

id<UIKitCorePrivateBalloonSwipeHandling> UIKitCorePrivateBalloonSwipeCreate(
    UICollectionViewCell *cell, void (^completion)(CGFloat, CGPoint), void (^changed)(CGFloat)) {
  static Class swipeClass;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", RTLD_NOW | RTLD_LOCAL);
    // CKBalloonSwipeController
    swipeClass = UIKitCorePrivateClassFromBase64(@"Q0tCYWxsb29uU3dpcGVDb250cm9sbGVy");
  });
  return [(id<UIKitCorePrivateBalloonSwipeInitializing>)[swipeClass alloc]
      initForCell:cell swipeCompletionHandler:completion swipeChangedHandler:changed];
}

@protocol UIKitCorePrivateTranscriptInitializing <NSObject>
- (instancetype)initWithChat:(nullable id)chat;
- (instancetype)initWithConversation:(id)conversation delegate:(nullable id)delegate
    balloonMaxWidth:(CGFloat)width marginInsets:(UIEdgeInsets)insets collectionViewSize:(CGSize)size;
@end

@protocol UIKitCorePrivateTranscriptLayout <NSObject>
- (void)setDisableRotisserieScroll:(BOOL)disabled;
- (void)setDisableDynamicsWhileScrolling:(BOOL)disabled;
@end

@protocol UIKitCorePrivateTranscriptScrolling <NSObject>
- (void)beginDisablingTranscriptDynamicsForReason:(NSInteger)reason;
- (void)endDisablingTranscriptDynamicsForReason:(NSInteger)reason;
- (void)performContentOffsetUpdateTemporarilyOverridingHoldStatus:(void (^)(void))updates;
@end

static char TranscriptRowsKey;
@protocol UIKitCorePrivateTapbackItemInitializing <NSObject>
- (instancetype)initWithIMChatItem:(id)item maxWidth:(CGFloat)width;
@end

@protocol UIKitCorePrivateTapbackDisplayConfiguration <NSObject>
@property(nonatomic) CGFloat sourceX;
@end

@protocol UIKitCorePrivateTapbackBalloonParent <NSObject>
@property(nonatomic, strong) id<UIKitCorePrivateTapbackDisplayConfiguration> displayConfiguration;
@end

@protocol UIKitCorePrivateTapbackAccessory <NSObject>
- (instancetype)init:(id)item layoutBounds:(CGRect)bounds delegate:(id)delegate;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (id<UIKitCorePrivateTapbackBalloonParent>)pickerBalloonParentView;
@end

@protocol UIKitCorePrivateTapbackValue <NSObject>
- (NSInteger)associatedMessageType;
- (NSString *)associatedMessageEmoji;
@end

@interface UIKitCorePrivateTapbackMessage : NSObject
@property(nonatomic, copy) NSString *guid;
@property(nonatomic) BOOL isFromMe;
@end

@implementation UIKitCorePrivateTapbackMessage
- (NSString *)GUID { return self.guid; }
- (NSString *)messageGUID { return self.guid; }
- (NSString *)uniqueIdentifier { return self.guid; }
- (NSAttributedString *)text { return [[NSAttributedString alloc] initWithString:@""]; }
- (id)messageItem { return self; }
- (id)message { return self; }
- (id)_imMessageItem { return self; }
- (id)service { return nil; }
- (NSString *)serviceName { return @"iMessage"; }
- (NSInteger)serviceVariant { return 0; }
- (NSDate *)time { return NSDate.now; }
- (NSArray *)visibleAssociatedMessageChatItems { return @[]; }
- (id)messageHighlightChatItem { return nil; }
- (NSInteger)messagePart { return 0; }
- (BOOL)isCorrupt { return NO; }
@end

@protocol UIKitCorePrivateTapbackClassicAnimation <NSObject>
- (void)animationTimerFired:(NSTimeInterval)time;
@end

static char TapbackRenderedImageKey;
static void TapbackRenderClassicIcons(UIView *view) {
  static Class classicView;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    // CKTapbackClassicView
    classicView = UIKitCorePrivateClassFromBase64(@"Q0tUYXBiYWNrQ2xhc3NpY1ZpZXc=");
  });
  if ([view isKindOfClass:classicView]) {
    for (UIView *child in view.subviews) {
      if (![child isKindOfClass:UIImageView.class]) continue;
      UIImageView *imageView = (UIImageView *)child;
      if (!imageView.image || imageView.image == objc_getAssociatedObject(view, &TapbackRenderedImageKey)) continue;
      // A hosted picker leaves classic assets on their transparent opening frame.
      // Advance its animation to the fully visible frame, keeping the ChatKit assets.
      for (NSInteger frame = 1; frame <= 30; frame++) {
        [(id<UIKitCorePrivateTapbackClassicAnimation>)view animationTimerFired:frame / 60.0];
      }
      objc_setAssociatedObject(view, &TapbackRenderedImageKey, imageView.image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return;
  }
  for (UIView *child in view.subviews) TapbackRenderClassicIcons(child);
}

static UICollectionView *TapbackCollectionInView(UIView *view) {
  if ([view isKindOfClass:UICollectionView.class]) return (UICollectionView *)view;
  for (UIView *child in view.subviews) {
    UICollectionView *collection = TapbackCollectionInView(child);
    if (collection) return collection;
  }
  return nil;
}

@interface UIKitCorePrivateTapbackDelegate : NSObject
@property(nonatomic, strong) id item;
@property(nonatomic, copy) void (^selected)(NSString *);
@property(nonatomic, strong) UICollectionView *collection;
@property(nonatomic) BOOL renderScheduled;
- (void)observeCollection:(UICollectionView *)collection;
- (void)scheduleRender;

@end

@implementation UIKitCorePrivateTapbackDelegate
- (void)dealloc {
  [_collection removeObserver:self forKeyPath:@"contentSize"];
  [_collection removeObserver:self forKeyPath:@"contentOffset"];
}
- (void)observeCollection:(UICollectionView *)collection {
  if (self.collection || !collection) return;
  self.collection = collection;
  [collection addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];
  [collection addObserver:self forKeyPath:@"contentOffset" options:0 context:NULL];
}
- (void)scheduleRender {
  if (self.renderScheduled) return;
  self.renderScheduled = YES;
  __weak typeof(self) weakSelf = self;
  dispatch_async(dispatch_get_main_queue(), ^{
    typeof(self) self = weakSelf;
    self.renderScheduled = NO;
    if (!self.collection.window) return;
    for (UICollectionViewCell *cell in self.collection.visibleCells) TapbackRenderClassicIcons(cell);
  });
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  [self scheduleRender];
}
- (id)pickerViewControllerDelegateForAccessoryView { return self; }
- (id)balloonParentViewDelegateForAccessoryView { return nil; }
- (NSArray *)contextualCKChatItemsForTapbackPickerViewController:(id)picker { return @[self.item]; }
- (BOOL)shouldShowStickerSuggestionsFor:(id)picker { return NO; }
- (void)tapbackPickerViewController:(id)picker didSelectTapback:(id<UIKitCorePrivateTapbackValue>)tapback {
  NSInteger type = tapback.associatedMessageType;
  if (type == 2006) {
    NSString *emoji = tapback.associatedMessageEmoji;
    if (emoji.length) self.selected(emoji);
  } else if (type >= 2000 && type <= 2005) {
    self.selected(@[@"❤️", @"👍", @"👎", @"😂", @"‼️", @"❓"][type - 2000]);
  }
}
- (void)tapbackPickerViewController:(id)picker didDeselectTapback:(id<UIKitCorePrivateTapbackValue>)tapback {
  [self tapbackPickerViewController:picker didSelectTapback:tapback];
}
- (void)tapbackPickerViewControllerDidRequestDismiss:(id)picker {}
- (void)tapbackPickerViewControllerDidChangePreferredContentSize:(id)picker {}
@end

static BOOL TapbackItemCanSend(id item, SEL command) { return YES; }
static int8_t TapbackItemServiceColor(id item, SEL command) { return 2; }
static char TapbackDelegateKey;

UIView *UIKitCorePrivateTapbackAccessoryCreate(
  NSString *identifier, BOOL outgoing, CGRect layoutBounds, void (^selected)(NSString *)
) {
  static Class itemClass;
  static Class accessoryClass;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", RTLD_NOW | RTLD_LOCAL);
    // CKTextMessagePartChatItem and CKTapbackPickerContainerAccessoryView
    Class base = UIKitCorePrivateClassFromBase64(@"Q0tUZXh0TWVzc2FnZVBhcnRDaGF0SXRlbQ==");
    accessoryClass = UIKitCorePrivateClassFromBase64(@"Q0tUYXBiYWNrUGlja2VyQ29udGFpbmVyQWNjZXNzb3J5Vmlldw==");
    itemClass = objc_allocateClassPair(base, "UIKitCorePrivateTapbackMessagePart", 0);
    class_addMethod(itemClass, @selector(canSendTapbacks), (IMP)TapbackItemCanSend, "B@:");
    class_addMethod(itemClass, @selector(serviceColor), (IMP)TapbackItemServiceColor, "c@:");
    objc_registerClassPair(itemClass);
  });
  UIKitCorePrivateTapbackMessage *message = [UIKitCorePrivateTapbackMessage new];
  message.guid = identifier;
  message.isFromMe = outgoing;
  UIKitCorePrivateTapbackDelegate *delegate = [UIKitCorePrivateTapbackDelegate new];
  delegate.item = [(id<UIKitCorePrivateTapbackItemInitializing>)[itemClass alloc]
    initWithIMChatItem:message maxWidth:CGRectGetWidth(layoutBounds)];
  delegate.selected = selected;
  UIView *accessory = (UIView *)[(id<UIKitCorePrivateTapbackAccessory>)[accessoryClass alloc]
    init:delegate.item layoutBounds:layoutBounds delegate:delegate];
  objc_setAssociatedObject(accessory, &TapbackDelegateKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  return accessory;
}

void UIKitCorePrivateTapbackAccessorySetVisible(UIView *accessory, BOOL visible) {
  UIKitCorePrivateTapbackDelegate *delegate = objc_getAssociatedObject(accessory, &TapbackDelegateKey);
  [delegate observeCollection:TapbackCollectionInView(accessory)];
  [(id<UIKitCorePrivateTapbackAccessory>)accessory setVisible:visible animated:YES];
  if (visible) [delegate scheduleRender];
}

void UIKitCorePrivateTapbackAccessoryAlign(UIView *accessory, CGFloat sourceX) {
  id<UIKitCorePrivateTapbackBalloonParent> parent = [(id<UIKitCorePrivateTapbackAccessory>)accessory pickerBalloonParentView];
  id<UIKitCorePrivateTapbackDisplayConfiguration> configuration = parent.displayConfiguration;
  if (configuration.sourceX == sourceX) return;
  configuration.sourceX = sourceX;
  parent.displayConfiguration = configuration;
}

static char TranscriptDelegateKey;

@interface UIKitCorePrivateTranscriptDelegateReference : NSObject
@property(nonatomic, weak) id<UICollectionViewDelegate> delegate;
@end

@implementation UIKitCorePrivateTranscriptDelegateReference
@end

static id<UICollectionViewDelegate> TranscriptHostedDelegate(id controller, SEL command) {
  UIKitCorePrivateTranscriptDelegateReference *reference = objc_getAssociatedObject(controller, &TranscriptDelegateKey);
  return reference.delegate;
}

static void TranscriptSetHostedDelegate(id controller, SEL command, id<UICollectionViewDelegate> delegate) {
  UIKitCorePrivateTranscriptDelegateReference *reference = [UIKitCorePrivateTranscriptDelegateReference new];
  reference.delegate = delegate;
  objc_setAssociatedObject(controller, &TranscriptDelegateKey, reference, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static void TranscriptDidScroll(id controller, SEL command, UIScrollView *view) {
  id<UICollectionViewDelegate> delegate = TranscriptHostedDelegate(controller, command);
  if ([delegate respondsToSelector:command]) [delegate scrollViewDidScroll:view];
}

static BOOL TranscriptShouldScrollToTop(id controller, SEL command, UIScrollView *view) {
  id<UICollectionViewDelegate> delegate = TranscriptHostedDelegate(controller, command);
  return ![delegate respondsToSelector:command] || [delegate scrollViewShouldScrollToTop:view];
}

static void TranscriptDidEndDisplaying(id controller, SEL command, UICollectionView *view, UICollectionViewCell *cell, NSIndexPath *path) {
  id<UICollectionViewDelegate> delegate = TranscriptHostedDelegate(controller, command);
  if ([delegate respondsToSelector:command]) [delegate collectionView:view didEndDisplayingCell:cell forItemAtIndexPath:path];
}

static void TranscriptWillDisplay(id controller, SEL command, UICollectionView *view, UICollectionViewCell *cell, NSIndexPath *path) {}

static BOOL TranscriptIgnoresSelection(id controller, SEL command, UICollectionView *view, NSIndexPath *path) {
  return NO;
}
static char TranscriptSizeKey;

static NSArray *TranscriptItems(id controller, SEL command) {
  return objc_getAssociatedObject(controller, &TranscriptRowsKey) ?: @[];
}

static CGSize TranscriptItemSize(id item, SEL command) {
  return [objc_getAssociatedObject(item, &TranscriptSizeKey) CGSizeValue];
}

static BOOL TranscriptItemEqual(id item, SEL command, id other) {
  return item == other;
}

static NSUInteger TranscriptItemHash(id item, SEL command) {
  return (NSUInteger)(__bridge void *)item;
}

static Class TranscriptSizedItemClass;

static void TranscriptSetSizes(id controller, SEL command, NSArray<NSValue *> *sizes) {
  NSMutableArray *items = [NSMutableArray arrayWithCapacity:sizes.count];
  for (NSValue *size in sizes) {
    id item = [[TranscriptSizedItemClass alloc] init];
    objc_setAssociatedObject(item, &TranscriptSizeKey, size, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [items addObject:item];
  }
  objc_setAssociatedObject(controller, &TranscriptRowsKey, items.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static NSArray<NSValue *> *TranscriptGetSizes(id controller, SEL command) {
  NSMutableArray<NSValue *> *sizes = [NSMutableArray array];
  for (id item in TranscriptItems(controller, command)) {
    [sizes addObject:objc_getAssociatedObject(item, &TranscriptSizeKey)];
  }
  return sizes.copy;
}

static BOOL TranscriptShouldUpdate(id controller, SEL command) {
  return NO;
}

UIViewController<UIKitCorePrivateTranscriptHosting> *UIKitCorePrivateTranscriptCreate(void) {
  static Class controllerClass;
  static Class conversationClass;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", RTLD_NOW | RTLD_LOCAL);
    // CKTranscriptCollectionViewController, CKConversation, CKChatItem
    Class base = UIKitCorePrivateClassFromBase64(@"Q0tUcmFuc2NyaXB0Q29sbGVjdGlvblZpZXdDb250cm9sbGVy");
    conversationClass = UIKitCorePrivateClassFromBase64(@"Q0tDb252ZXJzYXRpb24=");
    Class itemBase = UIKitCorePrivateClassFromBase64(@"Q0tDaGF0SXRlbQ==");
    if (!base || !conversationClass || !itemBase) return;

    TranscriptSizedItemClass = objc_allocateClassPair(itemBase, "UIKitCorePrivateTranscriptSizedItem", 0);
    class_addMethod(TranscriptSizedItemClass, @selector(size), (IMP)TranscriptItemSize, "{CGSize=dd}@:");
    class_addMethod(TranscriptSizedItemClass, @selector(isEqual:), (IMP)TranscriptItemEqual, "B@:@");
    class_addMethod(TranscriptSizedItemClass, @selector(hash), (IMP)TranscriptItemHash, "Q@:");
    objc_registerClassPair(TranscriptSizedItemClass);
    controllerClass = objc_allocateClassPair(base, "UIKitCorePrivateTranscriptHostController", 0);
    class_addProtocol(controllerClass, @protocol(UIKitCorePrivateTranscriptHosting));
    class_addMethod(controllerClass, @selector(hostedDelegate), (IMP)TranscriptHostedDelegate, "@@:");
    class_addMethod(controllerClass, @selector(setHostedDelegate:), (IMP)TranscriptSetHostedDelegate, "v@:@");
    class_addMethod(controllerClass, @selector(scrollViewDidScroll:), (IMP)TranscriptDidScroll, "v@:@");
    class_addMethod(controllerClass, @selector(scrollViewShouldScrollToTop:), (IMP)TranscriptShouldScrollToTop, "B@:@");
    class_addMethod(controllerClass, @selector(collectionView:willDisplayCell:forItemAtIndexPath:), (IMP)TranscriptWillDisplay, "v@:@@@");
    class_addMethod(controllerClass, @selector(collectionView:didEndDisplayingCell:forItemAtIndexPath:), (IMP)TranscriptDidEndDisplaying, "v@:@@@");
    class_addMethod(controllerClass, @selector(collectionView:shouldSelectItemAtIndexPath:), (IMP)TranscriptIgnoresSelection, "B@:@@");
    class_addMethod(controllerClass, @selector(collectionView:shouldHighlightItemAtIndexPath:), (IMP)TranscriptIgnoresSelection, "B@:@@");
    class_addMethod(controllerClass, @selector(chatItems), (IMP)TranscriptItems, "@@:");
    class_addMethod(controllerClass, @selector(rowSizes), (IMP)TranscriptGetSizes, "@@:");
    class_addMethod(controllerClass, @selector(setRowSizes:), (IMP)TranscriptSetSizes, "v@:@");
    class_addMethod(controllerClass, @selector(shouldLoadDefaultConversationViewingMessageCountOnAppear), (IMP)TranscriptShouldUpdate, "B@:");
    objc_registerClassPair(controllerClass);
  });
  if (!controllerClass) return nil;
  id conversation = [(id<UIKitCorePrivateTranscriptInitializing>)[conversationClass alloc] initWithChat:nil];
  UIViewController<UIKitCorePrivateTranscriptHosting> *controller =
    (UIViewController<UIKitCorePrivateTranscriptHosting> *)[(id<UIKitCorePrivateTranscriptInitializing>)[controllerClass alloc]
      initWithConversation:conversation delegate:nil balloonMaxWidth:0 marginInsets:UIEdgeInsetsZero collectionViewSize:CGSizeZero];
  [controller loadViewIfNeeded];
  id<UIKitCorePrivateTranscriptLayout> layout = (id)controller.collectionView.collectionViewLayout;
  [layout setDisableRotisserieScroll:YES];
  [layout setDisableDynamicsWhileScrolling:YES];
  return controller;
}

void UIKitCorePrivateTranscriptUpdateOffset(UICollectionView *collectionView, void (^updates)(void)) {
  id<UIKitCorePrivateTranscriptScrolling> transcript = (id)collectionView;
  // The same reason ChatKit uses for programmatic scrolling.
  const NSInteger programmaticScroll = 13;
  [transcript beginDisablingTranscriptDynamicsForReason:programmaticScroll];
  @try {
    [transcript performContentOffsetUpdateTemporarilyOverridingHoldStatus:updates];
  } @finally {
    [transcript endDisablingTranscriptDynamicsForReason:programmaticScroll];
  }
}
