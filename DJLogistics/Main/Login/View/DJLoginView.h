//
//  DJLoginView.h
//  DJLogistics
//
//  Created by Roc on 2017/9/30.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DJLoginViewDelegate <NSObject>

-(void)loginByPhone:(NSString *)phoneNum Password:(NSString *)password;

@end

@interface DJLoginView : UIView
/** delegate */
@property (nonatomic,weak)  id<DJLoginViewDelegate> delegate;
/** rootvc */
@property (nonatomic,weak) UIViewController *rootVc;
/** Logo */
@property (nonatomic,strong) UIImageView *logoView;

/** phoneImage */
@property (nonatomic,strong) UIImageView *phoneImage;
/** pwImge */
@property (nonatomic,strong) UIImageView *pwImge;
/** 显示隐藏按钮 */
@property (nonatomic,strong) UIButton *showHideImage;
/** 登陆按钮 */
@property (nonatomic,strong) UIButton *loginBtn;

/** 手机号输入框 */
@property (nonatomic,strong) UITextField *phoneTextField;

/** 密码输入框 */
@property (nonatomic,strong) UITextField *passWordTextField;

/** 手机号描述label */
@property (nonatomic,strong) UILabel *phoneDescribeLb;

/** 密码描述label */
@property (nonatomic,strong) UILabel *passWordDescribeLb;

/** 版本号label */
@property (nonatomic,strong) UILabel *versionLb;

/** phoneImageContentView */
@property (nonatomic,strong) UIView *phoneImageContentView;

/** pwImgeContentView */
@property (nonatomic,strong) UIView *pwImgeContentView;
/** 显示隐藏按钮ContentView */
@property (nonatomic,strong) UIView *showHideImageContentView;
@end
