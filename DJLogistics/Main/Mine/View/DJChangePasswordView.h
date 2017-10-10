//
//  DJChangePasswordView.h
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DJChangePasswordViewDelegate <NSObject>

-(void)changePasswordView:(NSString *)phoneNum oldPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword;

@end

@interface DJChangePasswordView : UIView
/** delegate */
@property (nonatomic,weak)  id<DJChangePasswordViewDelegate> delegate;
/** 原始密码textField */
@property (nonatomic,strong) UITextField *originalPWTextField;

/** 新密码textField */
@property (nonatomic,strong) UITextField *recentPWTextField;

/** 确认密码textField */
@property (nonatomic,strong) UITextField *ensurePWTextField;

/** 描述文字label */
@property (nonatomic,strong) UILabel *describeLb;

/** 确定按钮 */
@property (nonatomic,strong) UIButton *doneBtn;

/** line1 */
@property (nonatomic,strong) UIImageView *lineOne;

/** line2 */
@property (nonatomic,strong) UIImageView *lineTow;
/** 白色背景view */
@property (nonatomic,strong) UIImageView *whiteBGView;
@end
