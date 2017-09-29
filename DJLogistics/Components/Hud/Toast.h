//
//  Toast.h
//  Loan
//
//  Created by Roc on 16/9/26.
//  Copyright © 2016年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Toast : NSObject
#pragma mark HUD旧接口
// each makeToast method creates a view and displays it as toast
+ (void)showHud:(UIView*)rootView text:(NSString*)text;//显示HUD
+(void)hideHud:(UIView*)rootView;
+ (void)makeNoneInternetToast;
+ (void)makeToast:(NSString *)message mask:(BOOL)isMask;
+ (void)makeToastSuccess:(NSString *)message;
+ (void)makeToastError:(NSString *)message;
+ (void)makeToastWarning:(NSString *)message;
+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position;
// displays toast with an activity spinner
+ (void)makeToastActivity;
+ (void)hideToastActivity;

+ (void)makeToastActivity:(NSString *)message;
+ (void)makeToast:(NSString *)message;
+ (void)makeToastActivity:(NSString *)message hasMusk:(BOOL)hasMusk;
#pragma mark HUD新接口
/**
 * @简要 网络加载用指示器 显示在制定视图上 不可点击取消
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastActivityHUD:(UIView *)view;
/**
 * @简要 网络加载用指示器  显示在window上  可点击取消
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastShowWindowActivityHUD:(NSString *)message;

/**
 * @简要 网络加载用指示器
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastActivityHUD:(NSString *)message view:(UIView *)view;

/**
 * @简要 移除 HUD
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)hideToastActivityHUD:(UIView *)view;

/**
 * @简要 显示Success HUD
 * @参数 message : 显示信息
 * @参数 detailsText : 详细信息
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastSuccessHUD:(NSString *)message detailsText:(NSString *)details toView:(UIView *)view;

/**
 * @简要 显示Error HUD
 * @参数 message : 显示信息
 * @参数 detailsText : 详细信息
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastErrorHUD:(NSString *)message detailsText:(NSString *)details toView:(UIView *)view;

/**
 * @简要 显示Warning HUD
 * @参数 message : 显示信息
 * @参数 detailsText : 详细信息
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastWarningHUD:(NSString *)message detailsText:(NSString *)details toView:(UIView *)view;

/**
 * @简要 显示自定义Image HUD
 * @参数 message : 显示信息
 * @参数 imageName : 图片名称
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastHUD:(NSString *)message imageName:(UIImage *)name toView:(UIView *)view;

/**
 * @简要 只显示文字
 * @参数 message : 显示信息
 * @参数 view : 指定视图
 *
 * @返回
 */
+ (void)makeToastOnlyMessageHUD:(NSString *)message toView:(UIView *)view;


@end
