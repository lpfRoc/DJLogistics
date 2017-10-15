//
//  EaseBlankPageView.h
//  XDSThirdParty
//
//  Created by Hmily on 2016/12/15.
//  Copyright © 2016年 Hmily. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, EaseBlankPageType) {
    EaseBlankPageTypeView = 0,
    EaseBlankPageTypeViewMessageList,//消息列表
    EaseBlankPageTypeOrderCenter,//订单中心列表
    EaseBlankPageTypeWaybillCenter,//运单中心
    EaseBlankPageTypeBank_SEARCH,
    
    
};


@interface EaseBlankPageView : UIView

@property (strong, nonatomic) UIImageView *monkeyView;
@property (strong, nonatomic) UILabel *tipLabel;
@property (strong, nonatomic) UIButton *reloadButton;
@property (assign, nonatomic) EaseBlankPageType curType;
@property (copy, nonatomic) void(^reloadButtonBlock)(id sender);
@property (copy, nonatomic) void(^loadAndShowStatusBlock)();
@property (copy, nonatomic) void(^clickButtonBlock)(EaseBlankPageType curType);
- (void)configWithType:(EaseBlankPageType)blankPageType
               hasData:(BOOL)hasData
              hasError:(BOOL)hasError
               offsetY:(CGFloat)offsetY
     reloadButtonBlock:(void(^)(id sender))reloadButtonBlock
      clickButtonBlock:(void (^)(EaseBlankPageType curType))clickButtonBlock;

@end
