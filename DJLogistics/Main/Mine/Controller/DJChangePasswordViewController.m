//
//  DJChangePasswordViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJChangePasswordViewController.h"
#import "DJChangePasswordView.h"
@interface DJChangePasswordViewController ()<DJChangePasswordViewDelegate>
/** view */
@property (nonatomic,strong) DJChangePasswordView *changePasswordView;
@end

@implementation DJChangePasswordViewController
- (DJChangePasswordView *)changePasswordView
{
    if (_changePasswordView == nil) {
        
        _changePasswordView = [[DJChangePasswordView alloc] init];
        _changePasswordView.delegate = self;
    }
    return _changePasswordView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_changePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"更改密码";
    [self.view addSubview:self.changePasswordView];
    [self autoLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)changePasswordView:(NSString *)phoneNum oldPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword
{
    //
    NSDictionary *parameters = @{
                                 @"phone":phoneNum.length ? phoneNum :@"",
                                 @"oldpsd":oldPassword.length ? oldPassword :@"",
                                 @"newpsd":newPassword.length ? newPassword : @""
                                 };
    [ZDBaseRequestManager POSTJKID:@"editpassword" parameters:parameters success:^(id responseObject) {
        DJLog(@"%@",responseObject);
        _changePasswordView.describeLb.text = @"";
        if ([responseObject[@"code"] integerValue] == 1) {//修改成功
            
        }else
        {
            NSString *message = responseObject[@"msg"];
            if (message.length) {
                _changePasswordView.describeLb.text = [NSString stringWithFormat:@"*%@",message];

            }
        }
        [Toast makeToast:responseObject[@"msg"]];
    } failure:^(ZDURLResponseStatusCode errorCode) {
        
    }];
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
