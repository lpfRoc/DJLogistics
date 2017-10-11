//
//  DJWaybillModel.h
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJWaybillModel : NSObject
/** 时间日期 */
@property (nonatomic,strong) NSString *date;
/** 平台 例如:美/饿/百 */
@property (nonatomic,strong) NSString *platform;
/** 单号 */
@property (nonatomic,strong) NSString *daySeq;
/** 商户 */
@property (nonatomic,strong) NSString *shop;
/** 订餐人 */
@property (nonatomic,strong) NSString *tp_er;
/** 订餐电话 */
@property (nonatomic,strong) NSString *tp_phone;
/** 订餐地址 */
@property (nonatomic,strong) NSString *tp_detail;
/** 订单详情  */
@property (nonatomic,strong) NSString *order_detail;
/** 接单时间 */
@property (nonatomic,strong) NSString *grab;
/** 取餐时间 */
@property (nonatomic,strong) NSString *get;
/** 到店时间 */
@property (nonatomic,strong) NSString *arrived;
/** 送单时间 */
@property (nonatomic,strong) NSString *finish;
/** 备注消息 */
@property (nonatomic,strong) NSString *remark;
@end
