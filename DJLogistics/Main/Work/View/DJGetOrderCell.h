//
//  DJGetOrderCell.h
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJOrderModel.h"

typedef void(^RefreshTableBlock)(id requestObject);


@interface DJGetOrderCell : UITableViewCell

@property(nonatomic , strong) DJOrderModel *model;

@property (nonatomic , copy) RefreshTableBlock refreshTableBlock;

@property (nonatomic , copy) RefreshTableBlock failureTableBlock;

@end
