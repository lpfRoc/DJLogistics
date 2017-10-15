//
//  DJTabBarController.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJTabBarController.h"
#import "DJNavgationViewController.h"
#import "DJMineViewController.h"
#import "DJWorkViewController.h"
@interface DJTabBarController ()

@end

@implementation DJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.translucent = NO;
    
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    
    /**** 添加子控制器 ****/
    [self setupChildViewControllers];
    
    /**
     *  隐藏tabbar黑线
     */
//    [self.tabBar setShadowImage:[UIImage new]];
//    [self.tabBar setBackgroundImage:[UIImage new]];
}

/**
 *  设置所有UITabBarItem的文字属性
 */
- (void)setupItemTitleTextAttributes
{
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  添加子控制器
 */
- (void)setupChildViewControllers
{
    DJNavgationViewController *workNac = [[DJNavgationViewController alloc] initWithRootViewController:[[DJWorkViewController alloc] init]];
    workNac.tabBarItem.title = @"工作";
    DJNavgationViewController *MineCenteNav = [[DJNavgationViewController alloc] initWithRootViewController:[[DJMineViewController alloc] init]];
    MineCenteNav.tabBarItem.title = @"我的";
    
    self.viewControllers = @[workNac,MineCenteNav];

    NSArray * selectedImages = @[@"icon_workselect", @"icon_mineselect"];
    NSArray * notSelectedImages = @[@"icon_work", @"icon_mine"];
    NSArray * itemArray = self.tabBar.items;
    for (int i = 0; i < itemArray.count; i ++) {
        UITabBarItem * item = itemArray[i];
        item.selectedImage = [[UIImage imageNamed:selectedImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image=[[UIImage imageNamed:notSelectedImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    

}


@end
