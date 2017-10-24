//
//  DJMineWayBillModel.h
//  DJLogistics
//
//  Created by Roc on 2017/10/24.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJMineWayBillModel : NSObject
@property(nonatomic , copy) NSString *ID;
@property(nonatomic , copy) NSString *aid;
@property(nonatomic , copy) NSString *arrived;
@property(nonatomic , copy) NSString *canceltime;
@property(nonatomic , copy) NSString *confirmtime;
@property(nonatomic , copy) NSString *createtime;
@property(nonatomic , copy) NSString *date;
@property(nonatomic , copy) NSString *daySeq;
@property(nonatomic , copy) NSString *deliveryTime;
@property(nonatomic , copy) NSString *did;
@property(nonatomic , copy) NSString *dinnersnumber;
@property (nonatomic, copy) NSString *eid;
@property(nonatomic , copy) NSString *finish;
@property(nonatomic , copy) NSString *get;
@property(nonatomic , copy) NSString *grab;
@property(nonatomic , copy) NSString *invoicetitle;
@property(nonatomic , copy) NSString *invoicenumber;
@property(nonatomic , copy) NSString *ispre;
@property(nonatomic , copy) NSString *lat;
@property(nonatomic , copy) NSString *lng;
@property(nonatomic , copy) NSString *numbers;
@property(nonatomic , copy) NSString *orderId;
@property(nonatomic , copy) NSString *orderIdView;
@property(nonatomic , copy) NSString *order_caution;
//存储菜单的模型
@property (nonatomic, copy) NSString *order_detail;
@property(nonatomic , copy) NSString *order_extras;

@property(nonatomic , copy) NSString *order_price;
@property(nonatomic , copy) NSString *order_total;
@property(nonatomic , copy) NSString *payType;
@property(nonatomic , copy) NSString *platform;
@property(nonatomic , copy) NSString *remark;
@property(nonatomic , copy) NSString *reminder;
@property(nonatomic , copy) NSString *shop;
@property(nonatomic , copy) NSString *sid;
@property(nonatomic , copy) NSString *status;

@property(nonatomic , copy) NSString *store;
@property(nonatomic , copy) NSString *store_address;
@property(nonatomic , copy) NSString *store_tel;
@property(nonatomic , copy) NSString *timeout;
@property(nonatomic , copy) NSString *tp_detail;
@property(nonatomic , copy) NSString *tp_er;
@property(nonatomic , copy) NSString *tp_phone;
@property(nonatomic , copy) NSString *tp_point;
@property(nonatomic , copy) NSString *type;
@property(nonatomic , copy) NSString *unique;
@end
