//
//  MBProgressHUD+SCustomHUD.m
//  Loan
//
//  Created by Roc on 16/9/26.
//  Copyright © 2016年 Roc. All rights reserved.
//

#import "MBProgressHUD+SCustomHUD.h"
@interface MBProgressHUD () <CAAnimationDelegate>

@end

@implementation MBProgressHUD (SCustomHUD)

- (void)addAnimationWithImage:(UIImageView *)imageView{
    CABasicAnimation* rotationAnimation;
    //    UIViewAnimationOptionCurveEaseInOut
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0f];
    rotationAnimation.duration = 1.5f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.delegate = self;
    rotationAnimation.removedOnCompletion = NO;
    [imageView.layer addAnimation:rotationAnimation forKey:@"red"];
}

+ (MBProgressHUD *)showHub:(UIView *)view animated:(BOOL)animated
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70,70)];
    UIImageView * HUDImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_refresh_circle"]];
    HUDImageView.center = CGPointMake(CGRectGetWidth(v.bounds)/2, CGRectGetHeight(v.bounds)/2);
    [v addSubview:HUDImageView];
    
    [hud addAnimationWithImage:HUDImageView];

    UIImageView *imgView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_refresh_logo"]];
    imgView2.contentMode = UIViewContentModeScaleAspectFit;
    imgView2.center = CGPointMake(CGRectGetWidth(v.bounds)/2, CGRectGetHeight(v.bounds)/2);
    [v addSubview:imgView2];
    hud.customView = v;
    hud.mode = MBProgressHUDModeCustomView;

    return hud;
}

#pragma mark 网络加载数据
+ (MBProgressHUD *)showMessage:(NSString *)message
              detailsLabelText:(NSString *)details
                        toView:(UIView *)view {
    [self hideHUDForView:view];
    if (view == nil){
        UIWindow *currentWindow = nil;
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                currentWindow = window;
                break;
            }
        }
        view = currentWindow;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.opacity = 0.5;
    hud.square = YES;
    hud.labelText = message;
    if (details != nil) {
        hud.detailsLabelText = details;
    }

    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}

#pragma mark 网络加载数据 Window
+ (MBProgressHUD *)showWindowMessage:(NSString *)message
                          customView:(UIView *)customView{
    [self hideHUDForView:customView];
    UIWindow *currentWindow = nil;
    NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        if (window.windowLevel == UIWindowLevelNormal) {
            currentWindow = window;
            break;
        }
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:currentWindow animated:YES];
    hud.square = YES;
    hud.opacity = 0.5;
    hud.labelText = message;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = customView;
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideHUD)];
    [hud addGestureRecognizer:tap];
    return hud;
}

#pragma mark 网络加载数据 自定义加载视图
+ (MBProgressHUD *)showMessage:(NSString *)message
                    customView:(UIView *)customView
              detailsLabelText:(NSString *)details
                        toView:(UIView *)view {
    [self hideHUDForView:view];
    if (view == nil){
        UIWindow *currentWindow = nil;
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                currentWindow = window;
                break;
            }
        }
        view = currentWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.square = YES;
    hud.opacity = 0.5;
    hud.labelText = message;
    if (details != nil) {
        hud.detailsLabelText = details;
    }
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    hud.customView = customView;
    return hud;
}

#pragma mark 显示信息+自定义视图 interval秒后消失
+ (void)showMessageWithImage:(NSString *)message detailsLabelText:(NSString *)details customView:(UIView *)customView duration:(NSInteger)interval toView:(UIView *)view
{
    [self hideHUDForView:view];
    if (view == nil){
        UIWindow *currentWindow = nil;
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                currentWindow = window;
                break;
            }
        }
        view = currentWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //hud.square = YES;
    hud.opacity = 0.5;
    hud.labelText = message;
    if (details != nil) {
        hud.detailsLabelText = details;
    }
    hud.customView = customView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:interval];
}

#pragma mark 只显示文字 interval秒后消失
+ (void)onlyMessage:(NSString *)message duration:(NSInteger)interval toView:(UIView *)view {
    [self hideHUDForView:view];
    if (view == nil){
        UIWindow *currentWindow = nil;
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                currentWindow = window;
                break;
            }
        }
        view = currentWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //hud.square = YES;
    hud.opacity = 0.5;
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = message;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:interval];
}


#pragma mark 手动关闭MBProgressHUD
+ (void)hideHUD {
    [self hideHUDForView:nil];
}

#pragma mark 手动关闭MBProgressHUD
+ (void)hideHUDForView:(UIView *)view {
    if (view == nil){
        UIWindow *currentWindow = nil;
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                currentWindow = window;
                break;
            }
        }
        view = currentWindow;
    }
    [self hideAllHUDsForView:view animated:YES];
}
@end
