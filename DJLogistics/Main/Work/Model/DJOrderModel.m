//
//  DJOrderModel.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJOrderModel.h"

@implementation DJOrderModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
