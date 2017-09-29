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
    EaseBlankPageTypeOrders,//订单列表
    EaseBlankPageTypeWallets,//红包列表
    EaseBlankPageTypeRaisingRatesTickes,//加息券列表
    EaseBlankPageTypePoint,//积分列表
    EaseBlankPageTypeReservationTicket,//预约券列表
    EaseBlankPageTypeDiscountTicket,//优惠券列表
    EaseBlankPageTypeInvestmentProductNow,//投资资产列表 --持有
    EaseBlankPageTypeInvestmentProductHistory,//投资资产列表 -- 历史

    EaseBlankPageTypeTimeProduct,//定期产品列表
    EaseBlankPageTypeTranforProduct,//转让产品列表
    EaseBlankPageTypePersonProduct,//散标产品列表
    EaseBlankPageTypePlanProduct,//理财计划产品列表

    EaseBlankPageTypeNoNetWork,//无网络
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
