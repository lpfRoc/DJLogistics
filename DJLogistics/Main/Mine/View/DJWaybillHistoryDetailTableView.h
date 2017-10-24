//
//  DJWaybillHistoryDetailTableView.h
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJMineWayBillModel.h"
@interface DJWaybillHistoryDetailTableView : UITableView
/** rootVc */
@property (nonatomic,weak) UIViewController *rootVc;
/** model */
@property (nonatomic,strong) DJMineWayBillModel *model;
@end
