//
//  DJLoginView.m
//  DJLogistics
//
//  Created by Roc on 2017/9/30.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJLoginView.h"
#import "NSString+Extension.h"
#import "DJTabBarController.h"
@interface DJLoginView ()<UITextFieldDelegate>

@end

@implementation DJLoginView

#pragma mark - lazy
- (UIView *)showHideImageContentView
{
    if (_showHideImageContentView == nil) {
        
        _showHideImageContentView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
        [_showHideImageContentView addSubview:self.showHideImage];
        [_showHideImage mas_makeConstraints:^(MASConstraintMaker *make){
            make.center.equalTo(_showHideImageContentView);
        }];
    }
    return _showHideImageContentView;
}
- (UIView *)pwImgeContentView
{
    if (_pwImgeContentView == nil) {
        
        _pwImgeContentView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
        [_pwImgeContentView addSubview:self.pwImge];
        [_pwImge mas_makeConstraints:^(MASConstraintMaker *make){
            make.center.equalTo(_pwImgeContentView);
        }];
    }
    return _pwImgeContentView;
}
- (UIView *)phoneImageContentView
{
    if (_phoneImageContentView == nil) {
        
        _phoneImageContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
        [_phoneImageContentView addSubview:self.phoneImage];
        [_phoneImage mas_makeConstraints:^(MASConstraintMaker *make){
            make.center.equalTo(_phoneImageContentView);

        }];
    }
    return _phoneImageContentView;
}
- (UIButton *)loginBtn
{
    if (_loginBtn == nil) {
        
        _loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _loginBtn.layer.cornerRadius = 25;
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_loginBtn setBackgroundColor:COLOR_BlueDark];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _loginBtn.titleLabel.font = FONT_SIZE(15);
    }
    return _loginBtn;
}
- (UIImageView *)logoView
{
    if (_logoView == nil) {
        
        _logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mineselect"]];
        _logoView.backgroundColor = COLOR_Yellow;

    }
    return _logoView;
}
- (UIImageView *)phoneImage
{
    if (_phoneImage == nil) {
        
        _phoneImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mineselect"]];
        _phoneImage.backgroundColor = COLOR_Yellow;
    }
    return _phoneImage;
}
- (UIImageView *)pwImge
{
    if (_pwImge == nil) {
        
        _pwImge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mineselect"]];
        _pwImge.backgroundColor = COLOR_Yellow;

    }
    return _pwImge;
}
- (UIButton *)showHideImage
{
    if (_showHideImage == nil) {
        _showHideImage = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_showHideImage addTarget:self action:@selector(showHindeAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_showHideImage setImage:[UIImage imageNamed:@"icon_mineselect"] forState:(UIControlStateNormal)];
    }
    return _showHideImage;
}
- (UILabel *)phoneDescribeLb
{
    if (_phoneDescribeLb == nil) {
        
        _phoneDescribeLb = [[UILabel alloc] init];
        _phoneDescribeLb.textAlignment = NSTextAlignmentRight;
        _phoneDescribeLb.textColor = COLOR_Orange;
        _phoneDescribeLb.font = FONT_SIZE(10);
    }
    return _phoneDescribeLb;
}

- (UILabel *)passWordDescribeLb
{
    if (_passWordDescribeLb == nil) {
        
        _passWordDescribeLb = [[UILabel alloc] init];
        _passWordDescribeLb.textAlignment = NSTextAlignmentRight;
        _passWordDescribeLb.textColor = COLOR_Orange;
        _passWordDescribeLb.font = FONT_SIZE(10);
    }
    return _passWordDescribeLb;
}
- (UITextField *)phoneTextField
{
    if (_phoneTextField == nil) {
        
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.placeholder = @"请输入账号";
        _phoneTextField.delegate = self;
        _phoneTextField.backgroundColor = COLOR_BGFont;
        _phoneTextField.textColor = COLOR_FontText;
        _phoneTextField.layer.cornerRadius = 25;
        _phoneTextField.layer.borderColor = COLOR_GragDark.CGColor;
        _phoneTextField.layer.borderWidth = 1;
        _phoneTextField.layer.masksToBounds = YES;
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.font = FONT_SIZE(14);
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.leftView = self.phoneImageContentView;
        _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _phoneTextField;
}
- (UITextField *)passWordTextField
{
    if (_passWordTextField == nil) {
        
        _passWordTextField = [[UITextField alloc] init];
        _passWordTextField.placeholder = @"请输入密码";
        _passWordTextField.backgroundColor = COLOR_BGFont;
        _passWordTextField.textColor = COLOR_BlueDark;
        _passWordTextField.layer.cornerRadius = 25;
        _passWordTextField.layer.borderColor = COLOR_BlueDark.CGColor;
        _passWordTextField.layer.borderWidth = 1;
        _passWordTextField.layer.masksToBounds = YES;
        _passWordTextField.font = FONT_SIZE(14);
        _passWordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _passWordTextField.rightView = self.showHideImageContentView;
        _passWordTextField.rightViewMode = UITextFieldViewModeAlways;
        _passWordTextField.leftView =self.pwImgeContentView;
        _passWordTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _passWordTextField;
}
- (UILabel *)versionLb
{
    if (_versionLb == nil) {
        
        _versionLb = [[UILabel alloc] init];
        _versionLb.textColor = COLOR_GragDark;
        _versionLb.font = FONT_SIZE(10);
        _versionLb.textAlignment = NSTextAlignmentCenter;
        NSDictionary * info = [[NSBundle mainBundle] infoDictionary];
        _versionLb.text =  [NSString stringWithFormat:@"版本号：%@",info[@"CFBundleShortVersionString"]] ;
    }
    return _versionLb;
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubView];
    }
    return self;
}
#pragma mark - autoLayout
- (void)loginAutoLayout
{
    [_logoView mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).with.offset(AUTO_SIZE(45));
        make.size.mas_equalTo(CGSizeMake(AUTO_SIZE(90), AUTO_SIZE(65)));
        
    }];
    

    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.mas_right).with.offset(-AUTO_SIZE(35));
        make.left.equalTo(self.mas_left).with.offset(AUTO_SIZE(35));
        make.top.equalTo(_logoView.mas_bottom).with.offset(AUTO_SIZE(30));
        make.height.equalTo(@(AUTO_SIZE(50)));
        
    }];
    [_phoneDescribeLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_phoneTextField.mas_right).with.offset(-AUTO_SIZE(20));
        make.top.equalTo(_phoneTextField.mas_bottom).with.offset(AUTO_SIZE(5));
    }];
    [_passWordTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.mas_right).with.offset(-AUTO_SIZE(35));
        make.left.equalTo(self.mas_left).with.offset(AUTO_SIZE(35));
        make.top.equalTo(_phoneTextField.mas_bottom).with.offset(AUTO_SIZE(26));
        make.height.equalTo(@(AUTO_SIZE(50)));
    }];
    [_passWordDescribeLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(_passWordTextField.mas_right).with.offset(-AUTO_SIZE(20));
        make.top.equalTo(_passWordTextField.mas_bottom).with.offset(AUTO_SIZE(5));
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.mas_right).with.offset(-AUTO_SIZE(35));
        make.left.equalTo(self.mas_left).with.offset(AUTO_SIZE(35));
        make.top.equalTo(_passWordTextField.mas_bottom).with.offset(AUTO_SIZE(62));
        make.height.equalTo(@(AUTO_SIZE(50)));
    }];
    
    [_versionLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).with.offset(-AUTO_SIZE(20));

    }];
    
    
}

-(void)setUpSubView
{
    NSArray *viewArray = @[ self.logoView,self.passWordDescribeLb,self.phoneTextField,self.passWordTextField,self.loginBtn,self.phoneDescribeLb,self.versionLb];
    for (UIView *view in viewArray) {
        [self addSubview:view];
    }
    [self loginAutoLayout];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (!string.length) {
        return YES;
    }
    if ([textField isEqual:self.phoneTextField]) {
        if (textField.text.length == 11 && range.location == textField.text.length) {
            return NO;
        }
        NSString * allowInputString = @"0123456789";
        NSRange aRange = [allowInputString rangeOfString:string];
        if (aRange.location == NSNotFound) {
            return NO;
        }
    }
    return YES;
}

#pragma mark - Action
-(void)showHindeAction:(UIButton*) button
{
    button.selected = !button.selected;
    _passWordTextField.secureTextEntry = button.selected;
}
-(void)loginAction:(UIButton *)btn
{
    DJLog(@"登陆");
    _passWordDescribeLb.text = @"";
    _phoneDescribeLb.text = @"";
    DJLog(@"%@",_passWordTextField.text);
    if (![NSString validateMobile:_phoneTextField.text]) {
        _phoneDescribeLb.text = @"*手机号格式不正确";
    }
    if (![_passWordTextField.text isEqualToString:@"123"]) {
        _passWordDescribeLb.text = @"*密码与账号不匹配";
    }
    if (_passWordDescribeLb.text.length == 0 && _phoneDescribeLb.text.length == 0) {

        DJTabBarController *tabBarViewController = [[DJTabBarController alloc] init];

   [[[UIApplication sharedApplication] delegate] window].rootViewController =tabBarViewController;
    }
}
@end
