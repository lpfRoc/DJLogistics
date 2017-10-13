//
//  DJWorkViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWorkViewController.h"
#import "DJMessageCenterViewController.h"

@interface DJWorkViewController ()

@end

@implementation DJWorkViewController
-(void)setUpItemBtn
{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"icon_mineselect"]forState:UIControlStateNormal];
    [leftButton sizeToFit];
    leftButton.exclusiveTouch = YES;
    [leftButton addTarget:self action:@selector(leftBarButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    leftItem.tintColor =[UINavigationBar appearance].barTintColor;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"icon_mineselect"] forState:UIControlStateNormal];
    [button sizeToFit];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(rigntBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    rightItem.tintColor = [UINavigationBar appearance].barTintColor;
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"工作台";
    self.view.backgroundColor = COLOR_BG;
    // Do any additional setup after loading the view.
    [self setUpItemBtn];
}
-(void)leftBarButtonClick:(UIButton *)btn
{
    DJMessageCenterViewController *conteroller = [[DJMessageCenterViewController alloc] init];
    [self.navigationController pushViewController:conteroller animated:YES];
}
-(void)rigntBarButtonClick:(UIButton *)btn
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
