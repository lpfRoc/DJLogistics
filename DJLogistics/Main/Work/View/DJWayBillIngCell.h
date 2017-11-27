//
//  DJWayBillIngCell.h
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/21.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJMineWayBillModel.h"

typedef void(^RefreshDataBlock)();

@interface DJWayBillIngCell : UITableViewCell

@property (nonatomic , strong) DJMineWayBillModel *model;

@property (nonatomic , copy) RefreshDataBlock refreshDataBlock;
@end
