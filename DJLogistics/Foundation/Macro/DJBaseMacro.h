//
//  DJBaseMacro.h
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#ifndef DJBaseMacro_h
#define DJBaseMacro_h



// 信鸽开发者网站中申请App时，注册的AppId、AppKey
#define kXGAppKey          @"IRIX5Q9P515P"

//颜色
#define COLOR_W (DJColorFromRGB(0xFFFFFF))
/** 深蓝 */
#define COLOR_BlueDark  (DJColorFromRGB(0x075ad7))
#define color_808080  (DJColorFromRGB(0x808080))
/** 浅蓝色的线 */
#define COLOR_Line_FIrst (DJColorFromRGB(0xbed7fd))
/** 首页的消息背景色 */
#define COLOR_First_Background (DJColorFromRGB(0xf4f9ff))
/** 浅蓝 */
#define COLOR_Blue  (DJColorFromRGB(0x25abfa))
/** 橘色 */
#define COLOR_Orange  (DJRGBAColor(246,88,54,1))
/** 黄色 */
#define COLOR_Yellow  (DJColorFromRGB(0xf5a60d))
/** 背景色 */
#define COLOR_BG  (DJColorFromRGB(0xf4f9ff))
/** 深灰灰色icon背景 */
#define COLOR_GragDark  (DJColorFromRGB(0xa4a4a4))
/** 分割线色 */
#define COLOR_Line  (DJColorFromRGB(0xcccccc))
/** 深灰灰色icon背景 */
#define COLOR_Grag  (DJColorFromRGB(0xe8e8e8))
//文本颜色
/** 文本标题色 */
#define COLOR_FontTitle  (DJColorFromRGB(0x191919))
/** 文本色 */
#define COLOR_FontText  (DJColorFromRGB(0x666666))
/** 文本背景色 */
#define COLOR_BGFont  (DJColorFromRGB(0xf9f9f9))

#define DJRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define DJComnonRGBAColor(r,a) [UIColor colorWithRed:(r)/255.0f green:(r)/255.0f blue:(r)/255.0f alpha:(a)]
#define DJColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define  DJUser_Info [DJContextModel sharedInstance].currentUserInfo

#define IMAGE_BUNDLE_(__image_name__) [UIImage imageNamed:(__image_name__)]//图片

#define OCT_SYNTHESIZE_SINGLETON_FOR_CLASS(__class_name__) \
static __class_name__ *_instance; \
\
+ (__class_name__ *)shared##__class_name__ \
{ \
if (_instance == nil) { \
_instance = [[self alloc] init]; \
} \
return _instance; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}

/**
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@ZDWeakify_self`实现弱引用转换，`@ZDStrongify_self`实现强引用转换
 *
 * 示例：
 * @ZDWeakify_self
 * [obj block:^{
 * @ZDStrongify_self
 * self.property = something;
 * }];
 */
#ifndef    DJWeakify_self
#if __has_feature(objc_arc)
#define DJWeakify_self autoreleasepool{} __weak __typeof__(self) weakSelf = self;
#else
#define DJWeakify_self autoreleasepool{} __block __typeof__(self) blockSelf = self;
#endif
#endif
#ifndef    DJStrongify_self
#if __has_feature(objc_arc)
#define DJStrongify_self try{} @finally{} __typeof__(weakSelf) self = weakSelf;
#else
#define DJStrongify_self try{} @finally{} __typeof__(blockSelf) self = blockSelf;
#endif
#endif

#ifndef __OPTIMIZE__
#define DJLog(...) NSLog(__VA_ARGS__)
#else
#define DJLog(...) {}
#endif

#define UI_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define UI_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define  AUTO_SIZE(A) ([[UIScreen mainScreen] bounds].size.width/375*A)
#define IS_Retina ([[UIScreen mainScreen] scale] > 1)
#define ISRetina_Min_Line (IS_Retina? 0.5: 1)

#define  FONT_SIZE(A) ([UIFont systemFontOfSize:(A)])
#define  FONT_Bold_SIZE(A) ([UIFont boldSystemFontOfSize:(A)])
#define  AUTO_FONT_SIZE(A) ([UIFont systemFontOfSize:([[UIScreen mainScreen] bounds].size.width/375*A)])
#define  AUTO_FONT_BOLD_SIZE(A) ([UIFont boldSystemFontOfSize:([[UIScreen mainScreen] bounds].size.width/375*A)])

#endif /* DJBaseMacro_h */
