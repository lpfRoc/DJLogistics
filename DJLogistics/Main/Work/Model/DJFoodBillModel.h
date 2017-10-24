//
//  DJFoodBillModel.h
//  DJLogistics
//
//  Created by Roc on 2017/10/24.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJFoodBillModel : NSObject
@property(nonatomic , copy) NSString *app_food_code;
@property(nonatomic , copy) NSString *box_num;
@property(nonatomic , copy) NSString *box_price;
@property(nonatomic , copy) NSString *cart_id;
@property(nonatomic , copy) NSString *food_discount;
@property(nonatomic , copy) NSString *food_name;
@property(nonatomic , copy) NSString *food_property;
@property(nonatomic , copy) NSString *price;
@property(nonatomic , copy) NSString *quantity;
@property(nonatomic , copy) NSString *sku_id;
@property(nonatomic , copy) NSString *spec;
@property (nonatomic, copy) NSString *unit;
@end
