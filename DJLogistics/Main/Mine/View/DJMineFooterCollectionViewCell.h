//
//  DJMineFooterCollectionViewCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJMineFooterCollectionViewCell : UICollectionViewCell
/** titleLb */
@property (nonatomic,strong) UILabel *titleLb;

/** describeLb */
@property (nonatomic,strong) UILabel *contentLb;
/** 数据 */
@property (nonatomic,strong) NSDictionary *modeDic;
@end
