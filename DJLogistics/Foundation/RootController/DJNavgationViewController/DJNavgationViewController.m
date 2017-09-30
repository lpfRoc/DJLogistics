//
//  DJNavgationViewController.m
//  Loan
//
//  Created by Roc on 17/9/28.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJNavgationViewController.h"
#import "UIImage+ZDExtension.h"
@interface DJNavgationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DJNavgationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航控制器为手势识别器的代理
    self.interactivePopGestureRecognizer.delegate = self;

    /**
     *  设置导航栏属性
     */
    [self setUpNavigationBar];
    
    
}

- (void)setUpNavigationBar
{
    UIImage *bgImage = [UIImage imageWithColor:COLOR_BlueDark size:CGSizeMake(UI_SCREEN_WIDTH, 64)];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                               NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
    [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];

    /**
     *  置空阴影线
     */
    [self.navigationBar setShadowImage:[UIImage new]];
}
/**
 *  重写push方法的目的 : 拦截所有push进来的子控制器
 *
 *  @param viewController 刚刚push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果viewController不是最早push进来的子控制器
        // 左上角
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"ico_back"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"ico_back"] forState:UIControlStateHighlighted];
//        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        // 这句代码放在sizeToFit后面
//        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        // 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [self.view endEditing:YES];
    // 所有设置搞定后, 再push控制器
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
    [self.view endEditing:YES];
    return self.childViewControllers.count > 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
