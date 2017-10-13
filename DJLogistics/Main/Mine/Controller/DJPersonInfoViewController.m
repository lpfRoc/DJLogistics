//
//  DJPersonInfoViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJPersonInfoViewController.h"
#import "DJPersonInfoTableView.h"
#import "DJNavgationViewController.h"
#import "DJLoginViewController.h"
#import "DJChangePasswordViewController.h"
@interface DJPersonInfoViewController ()
/** tableView */
@property (nonatomic,strong) DJPersonInfoTableView *personInfoTableView;
/** footView */
@property (nonatomic,strong) UIView *footView;

/** changePWBtn */
@property (nonatomic,strong) UIButton *changePwBtn;
/** logoutBtn */
@property (nonatomic,strong) UIButton *logoutBtn;
@end

@implementation DJPersonInfoViewController
- (UIView *)footView
{
    if (_footView == nil) {
        
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, AUTO_SIZE(155))];
        [_footView addSubview:self.changePwBtn];
        [_footView addSubview:self.logoutBtn];
        [self autoLayoutFooterView];
    }
    return _footView;
}
- (UIButton *)changePwBtn
{
    if (_changePwBtn == nil) {
        
        _changePwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changePwBtn.layer.cornerRadius = 25;
        _changePwBtn.layer.borderColor =COLOR_BlueDark.CGColor;
        _changePwBtn.layer.borderWidth = 1;
        [_changePwBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_changePwBtn setBackgroundColor:[UIColor clearColor]];
        [_changePwBtn setTitle:@"更改密码" forState:(UIControlStateNormal)];
        [_changePwBtn setTitleColor:COLOR_BlueDark forState:(UIControlStateNormal)];
        [_changePwBtn addTarget:self action:@selector(changePwAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _changePwBtn.titleLabel.font = FONT_SIZE(15);
    }
    return _changePwBtn;
}
- (UIButton *)logoutBtn
{
    if (_logoutBtn == nil) {
        
        _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _logoutBtn.layer.cornerRadius = 25;
        [_logoutBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_logoutBtn setBackgroundColor:COLOR_BlueDark];
        [_logoutBtn setTitle:@"注销账号" forState:(UIControlStateNormal)];
        [_logoutBtn addTarget:self action:@selector(logoutAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _logoutBtn.titleLabel.font = FONT_SIZE(15);
    }
    return _logoutBtn;
}
- (DJPersonInfoTableView *)personInfoTableView
{
    if (_personInfoTableView == nil) {
        
        _personInfoTableView = [[DJPersonInfoTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _personInfoTableView.tableFooterView = self.footView;
        _personInfoTableView.rootVc = self;
    }
    return _personInfoTableView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_personInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
-(void)autoLayoutFooterView
{
    [_changePwBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_footView.mas_left).with.offset(AUTO_SIZE(35));
        make.top.equalTo(_footView.mas_top).with.offset(AUTO_SIZE(44));
        make.height.equalTo(@(AUTO_SIZE(50)));
        make.width.equalTo(@( UI_SCREEN_WIDTH -  AUTO_SIZE(70)));

    }];
    
    [_logoutBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_footView.mas_left).with.offset(AUTO_SIZE(35));
        make.top.equalTo(_changePwBtn.mas_bottom).with.offset(AUTO_SIZE(15));
        make.height.equalTo(@(AUTO_SIZE(50)));
        make.width.equalTo(@( UI_SCREEN_WIDTH -  AUTO_SIZE(70)));

    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人资料";
    [self.view addSubview:self.personInfoTableView];
    [self autoLayout];
}
#pragma mark - action
- (void)logoutAction:(UIButton *)btn
{
    DJLog(@"退出登陆");
    [ZDBaseRequestManager POSTJKID:@"logout" parameters:@{@"id":DJUser_Info.ID} success:^(id responseObject) {
        DJLog(@"%@",responseObject);
        if ([responseObject[@"code"] integerValue] == 1) {//退出成功
            
            [[DJCacheDataModel sharedInstance] clearUserInfoWhenLogout];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                DJNavgationViewController*nav = [[DJNavgationViewController alloc]initWithRootViewController:[[DJLoginViewController alloc] init]];
                [[[UIApplication sharedApplication] delegate] window].rootViewController =nav;
            });
        }
        [Toast makeToast:responseObject[@"msg"]];
    } failure:^(ZDURLResponseStatusCode errorCode) {
        
    }];


}
-(void)changePwAction:(UIButton *)btn
{
    DJLog(@"更改密码");
    [self.navigationController pushViewController:[[DJChangePasswordViewController alloc] init] animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
