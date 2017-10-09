//
//  DJLoginViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJLoginViewController.h"
#import "DJLoginView.h"
#import "DJTabBarController.h"
@interface DJLoginViewController ()<DJLoginViewDelegate>
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
        _loginView.delegate = self;
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

-(void)loginByPhone:(NSString *)phoneNum Password:(NSString *)password
{
    NSDictionary * info = [[NSBundle mainBundle] infoDictionary];
    NSDictionary *parameters = @{
                                 @"phone":phoneNum,
                                 @"password":password,
                                 @"appversion":info[@"CFBundleShortVersionString"]
                                 };
    [ZDBaseRequestManager POSTJKID:@"login" parameters:parameters success:^(id responseObject) {
        DJLog(@"%@",responseObject);
        _loginView.passWordDescribeLb.text = @"";
        if ([responseObject[@"code"] integerValue] == 1) {//登陆成功
            
            NSDictionary *result = responseObject[@"result"];
             DJUserModel *userModel = [DJUserModel yy_modelWithDictionary:result];
            //存储用户登录数据
            DJUser_Info = userModel;
            
            DJTabBarController *tabBarViewController = [[DJTabBarController alloc] init];
            [[[UIApplication sharedApplication] delegate] window].rootViewController =tabBarViewController;
        }else
        {
            _loginView.passWordDescribeLb.text = responseObject[@"msg"];
        }
        [Toast makeToast:responseObject[@"msg"]];
    } failure:^(ZDURLResponseStatusCode errorCode) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
