//
//  DJMineWaybillTableViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineWaybillTableViewCell.h"

@implementation DJMineWaybillTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - 界面初始化

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_W;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
