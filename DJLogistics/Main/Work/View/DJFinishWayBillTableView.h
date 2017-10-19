//
//  DJFinishWayBillTableView.h
//  DJLogistics
//
//  Created by Roc on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJFinishWayBillTableView : UITableView
/** dataArr */
@property (nonatomic,strong) NSMutableArray *dataArr;
/** rootVc */
@property (nonatomic,weak) UIViewController *rootVc;
@end
