//
//  DJChangePasswordView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJChangePasswordView.h"

@implementation DJChangePasswordView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =COLOR_BG;
        [self initSubView];
        
    }
    return self;
}

#pragma mark - lazy

- (UITextField *)originalPWTextField
{
    if (_originalPWTextField == nil) {
        
        _originalPWTextField = [[UITextField alloc] init];
        _originalPWTextField.font = FONT_SIZE(15);
        _originalPWTextField.secureTextEntry = YES;
        _originalPWTextField.placeholder =@"请输入原密码";
        _originalPWTextField.clearButtonMode = UITextFieldViewModeWhileEditing;

    }
    return _originalPWTextField;
}
- (UITextField *)recentPWTextField
{
    if (_recentPWTextField == nil) {
        
        _recentPWTextField = [[UITextField alloc] init];
        _recentPWTextField.font = FONT_SIZE(15);
        _recentPWTextField.secureTextEntry = YES;
        _recentPWTextField.placeholder = @"请输入新密码";
        _recentPWTextField.clearButtonMode = UITextFieldViewModeWhileEditing;

    }
    return _recentPWTextField;
}
- (UITextField *)ensurePWTextField
{
    if (_ensurePWTextField == nil) {
        
        _ensurePWTextField = [[UITextField alloc] init];
        _ensurePWTextField.font = FONT_SIZE(15);
        _ensurePWTextField.secureTextEntry = YES;
        _ensurePWTextField.placeholder = @"确认新密码";
        _ensurePWTextField.clearButtonMode = UITextFieldViewModeWhileEditing;

    }
    return _ensurePWTextField;
}
- (UILabel *)describeLb
{
    if (_describeLb == nil) {
        _describeLb = [[UILabel alloc] init];
        _describeLb.font = FONT_SIZE(10);
        _describeLb.textAlignment = NSTextAlignmentRight;
        _describeLb.textColor = COLOR_Orange;
    }
    return _describeLb;
}
- (UIButton *)doneBtn
{
    if (_doneBtn == nil) {
        _doneBtn =[UIButton buttonWithType:(UIButtonTypeCustom)];
        _doneBtn.layer.cornerRadius = 25;
        [_doneBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_doneBtn setBackgroundColor:COLOR_BlueDark];
        [_doneBtn setTitle:@"确定" forState:(UIControlStateNormal)];
        [_doneBtn addTarget:self action:@selector(doneAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _doneBtn.titleLabel.font = FONT_SIZE(15);
        
    }
    return _doneBtn;
}
- (UIImageView *)lineOne
{
    if (_lineOne == nil) {
        
        _lineOne = [[UIImageView alloc] init];
        _lineOne.backgroundColor = COLOR_Line;
    }
    return _lineOne;
}
- (UIImageView *)lineTow
{
    if (_lineTow == nil) {
        
        _lineTow = [[UIImageView alloc] init];
        _lineTow.backgroundColor = COLOR_Line;
    }
    return _lineTow;
}
- (UIImageView *)whiteBGView
{
    if (_whiteBGView == nil) {
        
        _whiteBGView = [[UIImageView alloc] init];
        _whiteBGView.backgroundColor = COLOR_W;
        _whiteBGView.userInteractionEnabled = YES;
    }
    return _whiteBGView;
}
#pragma mark - autoLayout
- (void)whiteBGViewAutoLayout
{

    [_originalPWTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_whiteBGView.mas_top).with.offset(AUTO_SIZE(15));
        make.right.equalTo(_whiteBGView.mas_right).with.offset(-AUTO_SIZE(20));
        make.left.equalTo(_whiteBGView.mas_left).with.offset(AUTO_SIZE(20));
    }];
    [_lineOne mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_whiteBGView.mas_top).with.offset(AUTO_SIZE(50)-ISRetina_Min_Line);
        make.height.equalTo(@(ISRetina_Min_Line));
        make.right.equalTo(_whiteBGView.mas_right);
        make.left.equalTo(_whiteBGView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
    [_recentPWTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_lineOne.mas_bottom).with.offset(AUTO_SIZE(15));
        make.right.equalTo(_whiteBGView.mas_right).with.offset(-AUTO_SIZE(20));
        make.left.equalTo(_whiteBGView.mas_left).with.offset(AUTO_SIZE(20));
    }];
    [_lineTow mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_whiteBGView.mas_top).with.offset(AUTO_SIZE(100)-ISRetina_Min_Line);
        make.height.equalTo(@(ISRetina_Min_Line));
        make.right.equalTo(_whiteBGView.mas_right);
        make.left.equalTo(_whiteBGView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
    [_ensurePWTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_lineTow.mas_bottom).with.offset(AUTO_SIZE(15));
        make.right.equalTo(_whiteBGView.mas_right).with.offset(-AUTO_SIZE(20));
        make.left.equalTo(_whiteBGView.mas_left).with.offset(AUTO_SIZE(20));
    }];
    
}
- (void)autoLayout
{
    [_whiteBGView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mas_top).with.offset(AUTO_SIZE(10));
        make.right.left.equalTo(self);
        make.height.equalTo(@(AUTO_SIZE(150)));
    }];
    
    [_describeLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_whiteBGView.mas_bottom).with.offset(AUTO_SIZE(10));
        make.right.equalTo(self.mas_right).with.offset(AUTO_SIZE(-15));
    }];
    
    [_doneBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_whiteBGView.mas_bottom).with.offset(AUTO_SIZE(40));
        make.right.equalTo(self.mas_right).with.offset(-AUTO_SIZE(35));
        make.left.equalTo(self.mas_left).with.offset(AUTO_SIZE(35));
        make.height.equalTo(@(AUTO_SIZE(50)));
    }];
    
    
}
- (void)initSubView
{
    NSArray *whiteBGViewArray = @[ self.originalPWTextField,self.lineOne,self.recentPWTextField,self.lineTow,self.ensurePWTextField];
    _originalPWTextField.keyboardType = UIKeyboardTypeDefault;
    _recentPWTextField.keyboardType = UIKeyboardTypeDefault;
    _ensurePWTextField.keyboardType = UIKeyboardTypeDefault;
    for (UIView *view in whiteBGViewArray) {
        [self.whiteBGView addSubview:view];
    }
    [self whiteBGViewAutoLayout];
    
    NSArray *viewArray = @[self.whiteBGView,self.describeLb,self.doneBtn];
    
    for (UIView *view in viewArray) {
        [self addSubview:view];
    }
    [self autoLayout];
}
- (void)doneAction:(UIButton *)btn
{
    NSString *message = @"";
    if (_recentPWTextField.text.length < 6 || _ensurePWTextField.text.length < 6 ){
        message = @"*密码长度必须为6位或以上，请重新输入";
    }else if (![_recentPWTextField.text isEqualToString:_ensurePWTextField.text]){
        message = @"*两次输入的密码不一致";
    }
    if (message.length) {
        _describeLb.text = message;
        return ;
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(changePasswordView:oldPassword:newPassword:)]) {
        [_delegate changePasswordView:DJUser_Info.phone oldPassword:_originalPWTextField.text newPassword:_recentPWTextField.text];
    }
}
@end
