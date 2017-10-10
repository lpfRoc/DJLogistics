//
//  DJPersonInfoTableViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJPersonInfoTableViewCell.h"

@implementation DJPersonInfoTableViewCell
#pragma mark - 界面初始化

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_W;
        NSArray *viewArray = @[self.nameLabel, self.iconImageView];
        for (UIView *view in viewArray) {
            [self.contentView addSubview:view];
        }
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        }];
        
    }
    return self;
}
#pragma mark - lazy
- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT_SIZE(13);
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = COLOR_FontTitle;
        _nameLabel.text = @"头像";
        
    }
    return _nameLabel;
}
- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mineselect"]];
    }
    return _iconImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
