//
//  DJMineFooterView.h
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DJMineFooterView : UIView
/** icon */
@property (nonatomic,strong) UIImageView *icon;
/** 工作历史 */
@property (nonatomic,strong) UILabel *describeTitle;
/** arrow */
@property (nonatomic,strong) UIImageView *arrow;
/** line */
@property (nonatomic,strong) UIImageView *devideLine;
/** collectionView */
@property (nonatomic,strong) UICollectionView *workCollectionView;
/** model */
@property (nonatomic,strong) NSArray *dataArr;
@end
