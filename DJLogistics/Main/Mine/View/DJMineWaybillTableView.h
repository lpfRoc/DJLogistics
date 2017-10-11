//
//  DJMineWaybillTableView.h
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJMineWaybillTableView : UITableView
/** dataArr */
@property (nonatomic,strong) NSArray *dataArr;
/** rootVc */
@property (nonatomic,weak) UIViewController *rootVc;
@end
