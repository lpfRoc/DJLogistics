//
//  DJLoginViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJLoginViewController.h"
#import "DJLoginView.h"
@interface DJLoginViewController ()
/** 登录视图 */
@property (nonatomic,strong) DJLoginView *loginView;
@end

@implementation DJLoginViewController

#pragma mark - autoLayout
- (DJLoginView *)loginView
{
    if (_loginView == nil) {
        
        _loginView = [[DJLoginView alloc] init];
        _loginView.rootVc =self;
    }
    return _loginView;
}
- (void)autoLayout
{
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    
}
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.loginView];
    [self autoLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
