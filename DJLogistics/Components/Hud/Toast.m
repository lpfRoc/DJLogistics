//
//  Toast.m
//  Loan
//
//  Created by Roc on 16/9/26.
//  Copyright © 2016年 Roc. All rights reserved.
//

#import "Toast.h"
#import "MBProgressHUD+SCustomHUD.h"
#import <GLKit/GLKMathUtils.h>
#import <UIKit/UIKit.h> 

// display duration and position
static const CGFloat CSToastDefaultDuration     = 1.5;

// activity
static const NSString * CSToastActivityDefaultPosition = @"center";
static const NSString * CSToastActivityViewKey  = @"CSToastActivityViewKey";

@implementation Toast

#pragma mark - Toast Methods
+ (void)showHud:(UIView*)rootView text:(NSString*)text
{
    MBProgressHUD *HUD = [MBProgressHUD showHub:rootView animated:YES];
    HUD.backgroundColor = [UIColor clearColor];
    HUD.detailsLabelText = text;
    HUD.color = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.5f];
}
+ (void)makeNoneInternetToast {
    [self makeToastErrorHUD:@"没有网络，臣妾做不到＞﹏＜" detailsText:nil toView:nil];
}

+ (void)makeToast:(NSString *)message {
    [self makeToastErrorHUD:message detailsText:nil toView:nil];
}

+ (void)makeToast:(NSString *)message mask:(BOOL)isMask{
    [self makeToastErrorHUD:message detailsText:nil toView:nil];
}

+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position {
    [self makeToastErrorHUD:message detailsText:nil toView:nil];
}

+ (void)makeToastSuccess:(NSString *)message{
    [self makeToastSuccessHUD:message detailsText:nil toView:nil];
}

+ (void)makeToastError:(NSString *)message{
    [self makeToastErrorHUD:message detailsText:nil toView:nil];
}

+ (void)makeToastWarning:(NSString *)message{
    [self makeToastWarningHUD:message detailsText:nil toView:nil];
}


#pragma mark - Toast Activity Methods

+(void)hideHud:(UIView*)rootView{
  
    /**
     *  animated 动画会出现指示器移除不掉bug
     */
    [MBProgressHUD hideAllHUDsForView:rootView animated:NO];
}

#pragma mark HUD新接口
+ (void)makeToastActivityHUD:(UIView *)view {
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self setupInfiniteCircle:activityView];
    [MBProgressHUD showMessage:@"正在帮您加载..." customView:activityView detailsLabelText:nil toView:view];
}

+ (void)makeToastShowWindowActivityHUD:(NSString *)message {
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self setupInfiniteCircle:activityView];
    [MBProgressHUD showWindowMessage:message customView:activityView];
}

+ (void)makeToastActivityHUD:(NSString *)message view:(UIView *)view {
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self setupInfiniteCircle:activityView];
    [MBProgressHUD showMessage:message customView:activityView detailsLabelText:nil toView:view];
}

+ (void)hideToastActivityHUD:(UIView *)view{
    [MBProgressHUD hideHUDForView:view];
}

+ (void)makeToastSuccessHUD:(NSString *)message detailsText:(NSString *)details toView:(UIView *)view {
    //UIImageView *successImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
    //[MBProgressHUD showMessageWithImage:message detailsLabelText:details customView:successImage duration:CSToastDefaultDuration toView:view];
     [MBProgressHUD onlyMessage:message duration:CSToastDefaultDuration toView:view];
}

+ (void)makeToastErrorHUD:(NSString *)message detailsText:(NSString *)details toView:(UIView *)view {
    //UIImageView *errorImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"progresshud_error"]];
    //[MBProgressHUD showMessageWithImage:message detailsLabelText:details customView:errorImage duration:CSToastDefaultDuration toView:view];
    [MBProgressHUD onlyMessage:message duration:CSToastDefaultDuration toView:view];
}

+ (void)makeToastWarningHUD:(NSString *)message detailsText:(NSString *)details toView:(UIView *)view {
    //UIImageView *errorImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"warning"]];
    //[MBProgressHUD showMessageWithImage:message detailsLabelText:details customView:errorImage duration:CSToastDefaultDuration toView:view];
     [MBProgressHUD onlyMessage:message duration:CSToastDefaultDuration toView:view];
}

+ (void)makeToastHUD:(NSString *)message imageName:(UIImage *)name toView:(UIView *)view {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:name];
    [MBProgressHUD showMessage:message customView:imageView detailsLabelText:nil toView:view];
}

+ (void)makeToastOnlyMessageHUD:(NSString *)message toView:(UIView *)view{
    [MBProgressHUD onlyMessage:message duration:CSToastDefaultDuration toView:view];
}


#pragma mark HUD旧接口

+ (void)makeToastActivity{
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self setupInfiniteCircle:activityView];
    [MBProgressHUD showWindowMessage:@"正在帮您加载..." customView:activityView];
}

+ (void)hideToastActivity {
    [MBProgressHUD hideHUDForView:nil];
}
+ (void)makeToastActivity:(NSString *)message {
    [self makeToastShowWindowActivityHUD:message];
}

+ (void)makeToastActivity:(NSString *)message hasMusk:(BOOL)hasMusk
{
    [self makeToastShowWindowActivityHUD:message];
}


#pragma mark 创建环形指示器
+ (void)setupInfiniteCircle:(UIView *)customView {
    CGFloat radius = (customView.frame.size.width / 2.0f);
    CGPoint center = CGPointMake(radius, radius);
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center
                                                              radius:(radius - 5)
                                                          startAngle:GLKMathDegreesToRadians(-45.0f)
                                                            endAngle:GLKMathDegreesToRadians(275.0f)
                                                           clockwise:YES];
    
    CAShapeLayer *circleProgressLineLayer = [CAShapeLayer layer];
    circleProgressLineLayer.path = circlePath.CGPath;
    circleProgressLineLayer.lineCap = kCALineCapRound;
    circleProgressLineLayer.strokeColor = [UIColor whiteColor].CGColor;
    circleProgressLineLayer.fillColor = [UIColor clearColor].CGColor;
    circleProgressLineLayer.lineWidth = 1;
    
    [customView.layer addSublayer:circleProgressLineLayer];
    
    [circleProgressLineLayer removeAllAnimations];
    [customView.layer removeAllAnimations];
    [self animateCircleWithInfiniteLoop:customView];
}

+ (void)animateCircleWithInfiniteLoop:(UIView *)customView {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2.0f * 1.f);
    rotationAnimation.duration = 1.f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    
    [customView.layer addAnimation:rotationAnimation
                            forKey:@"rotationAnimation"];
}
@end
