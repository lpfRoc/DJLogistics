//
//  DJMessageCenterTableView.h
//  DJLogistics
//
//  Created by Roc on 2017/10/12.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJMessageCenterTableView : UITableView
/** rootvc */
@property (nonatomic,weak) UIViewController *rootVC;
/** modelArr */
@property (nonatomic,strong) NSArray *messageModelArr;
@end
