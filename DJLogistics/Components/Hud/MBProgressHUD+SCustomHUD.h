//
//  MBProgressHUD+SCustomHUD.h
//  Loan
//
//  Created by Roc on 16/9/26.
//  Copyright © 2016年 Roc. All rights reserved.
//

@interface MBProgressHUD (SCustomHUD)

+ (MBProgressHUD *)showHub:(UIView *)view animated:(BOOL)animated;

/**
 * @简要 网络加载数据
 * @参数 message 信息内容
 * @参数 view 显示的视图
 * @返回 返回HUD 需调用hideHUD移除
 */
+ (MBProgressHUD *)showMessage:(NSString *)message
              detailsLabelText:(NSString *)details
                        toView:(UIView *)view;

/**
 * @简要 网络加载数据 Window视图显示
 * @参数 message 信息内容
 * @参数 customView 自定义加载视图
 * @返回 返回HUD 需调用hideHUD移除
 */
+ (MBProgressHUD *)showWindowMessage:(NSString *)message
                          customView:(UIView *)customView;

/**
 * @简要 网络加载数据 自定义加载视图
 * @参数 message 信息内容
 * @参数 customView 自定义加载视图
 * @参数 view 显示的视图
 * @返回 返回HUD 需调用hideHUD移除
 */
+ (MBProgressHUD *)showMessage:(NSString *)message
                    customView:(UIView *)customView
              detailsLabelText:(NSString *)details
                        toView:(UIView *)view;

/**
 * @简要 显示信息+图片 interval秒后消失
 * @参数 message 信息内容
 * @参数 details 详细内容
 * @参数 customView 自定义视图
 * @参数 interval 持续时长
 * @参数 view 显示的视图
 */
+ (void)showMessageWithImage:(NSString *)message
            detailsLabelText:(NSString *)details
                  customView:(UIView *)customView
                    duration:(NSInteger)interval
                      toView:(UIView *)view;

/**
 * @简要 只显示文字 interval秒后消失
 * @参数 message 信息内容
 * @参数 interval 持续时长
 * @参数 view 显示的视图
 */
+ (void)onlyMessage:(NSString *)message
           duration:(NSInteger)interval
             toView:(UIView *)view;

/**
 * @简要 手动关闭HUD
 */
+ (void)hideHUD;

/**
 * @简要 手动关闭MBProgressHUD
 */
+ (void)hideHUDForView:(UIView *)view;
@end
