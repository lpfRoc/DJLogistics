//
//  DJOrderModel.h
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJOrderModel : NSObject
@property(nonatomic , copy) NSString *ID;
@property(nonatomic , copy) NSString *sid;
@property(nonatomic , copy) NSString *date;
@property(nonatomic , copy) NSString *platform;
@property(nonatomic , copy) NSString *numbers;
@property(nonatomic , copy) NSString *unique;
@property(nonatomic , copy) NSString *shop;
@property(nonatomic , copy) NSString *tp_er;
@property(nonatomic , copy) NSString *tp_phone;
@property(nonatomic , copy) NSDictionary *order_detail;
@property(nonatomic , copy) NSString *createtime;
@property (nonatomic, copy) NSString *status;
@property(nonatomic , copy) NSString *tp_detail;
@property (nonatomic ,copy) NSString *lat;
@property (nonatomic ,copy) NSString *lng;
@property (nonatomic ,copy) NSString *store;
@property (nonatomic ,copy) NSString *deliveryTime;
@property (nonatomic ,copy) NSString *daySeq;


@end
