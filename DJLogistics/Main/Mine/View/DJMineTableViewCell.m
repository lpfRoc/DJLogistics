//
//  DJMineTableViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineTableViewCell.h"

@implementation DJMineTableViewCell

#pragma mark - 界面初始化

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.mineTableViewCellStyle = DJMineTableViewCellStyleMineleInit;
        self.backgroundColor = COLOR_W;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return self;
}
#pragma mark - lazy
- (UIImageView *)arrow
{
    if (_arrow == nil) {
        
        _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_arrow"]];
    }
    return _arrow;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT_SIZE(13);
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = COLOR_FontTitle;
        _nameLabel.text = DJUser_Info.name;
    }
    return _nameLabel;
}

- (UILabel *)phoneLabel
{
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.font = FONT_SIZE(13);
        _phoneLabel.textAlignment = NSTextAlignmentLeft;
        _phoneLabel.textColor = COLOR_FontText;
        _phoneLabel.text = DJUser_Info.phone;
    }
    return _phoneLabel;
}

- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mineselect"]];
    }
    return _iconImageView;
}
- (UIImageView *)stationIcon
{
    if (_stationIcon == nil) {
        _stationIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mineselect"]];
    }
    return _stationIcon;
}
- (UIImageView *)devideLine
{
    if (_devideLine == nil) {
        _devideLine = [[UIImageView alloc] init];
        _devideLine.backgroundColor = COLOR_Line;
    }
    return _devideLine;
}
- (UILabel *)stationInfoDescLabel
{
    if (_stationInfoDescLabel == nil) {
        _stationInfoDescLabel = [[UILabel alloc] init];
        _stationInfoDescLabel.font = FONT_SIZE(14);
        _stationInfoDescLabel.textAlignment = NSTextAlignmentLeft;
        _stationInfoDescLabel.textColor = COLOR_FontText;
        _stationInfoDescLabel.text = @"站点信息";
    }
    return _stationInfoDescLabel;
}

- (UILabel *)stationNameLabel
{
    if (_stationNameLabel == nil) {
        _stationNameLabel = [[UILabel alloc] init];
        _stationNameLabel.font = FONT_SIZE(16);
        _stationNameLabel.textAlignment = NSTextAlignmentCenter;
        _stationNameLabel.textColor = COLOR_BlueDark;
        _stationNameLabel.text = DJUser_Info.site;
    }
    return _stationNameLabel;
}
- (UILabel *)stationDetailLabel
{
    if (_stationDetailLabel== nil) {
        _stationDetailLabel = [[UILabel alloc] init];
        _stationDetailLabel.font = FONT_SIZE(11);
        _stationDetailLabel.textAlignment = NSTextAlignmentCenter;
        _stationDetailLabel.textColor = COLOR_FontText;
        _stationDetailLabel.text = [NSString stringWithFormat:@"%@ %@",DJUser_Info.province,DJUser_Info.city];
    }
    return _stationDetailLabel;
}

-(void)setMineTableViewCellStyle:(DJMineTableViewCellStyle)mineTableViewCellStyle
{
    _mineTableViewCellStyle = mineTableViewCellStyle;
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    switch (mineTableViewCellStyle) {
        case DJMineTableViewCellStyleMineInfo:
        {
            NSArray *viewArray = @[self.nameLabel,self.phoneLabel, self.iconImageView,self.arrow];
            for (UIView *view in viewArray) {
                [self.contentView addSubview:view];
            }
            [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(15));
                make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(20));
                make.size.mas_equalTo(CGSizeMake(50, 50));
            }];
            
            [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.equalTo(_iconImageView.mas_top).with.offset(AUTO_SIZE(10));
                make.left.equalTo(_iconImageView.mas_right).with.offset(AUTO_SIZE(15));
                
            }];
            
            [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make){
                make.bottom.equalTo(_iconImageView.mas_bottom).with.offset(AUTO_SIZE(-5));
                make.left.equalTo(_iconImageView.mas_right).with.offset(AUTO_SIZE(15));
            }];
            
            [_arrow mas_makeConstraints:^(MASConstraintMaker *make){
                make.centerY.equalTo(_iconImageView.mas_centerY);
                make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-20));
                make.size.mas_equalTo(CGSizeMake(8, 15));
            }];
        }
            break;
        case DJMineTableViewCellStyleStationInfo:
        {
            self.accessoryType = UITableViewCellAccessoryNone;

            NSArray *viewArray = @[self.stationDetailLabel,self.stationNameLabel, self.stationIcon,self.stationInfoDescLabel,self.devideLine];
            for (UIView *view in viewArray) {
                [self.contentView addSubview:view];
            }
            [_stationIcon mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(15));
                make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(20));
                make.size.mas_equalTo(CGSizeMake(20, 20));
            }];
            
            [_stationInfoDescLabel mas_makeConstraints:^(MASConstraintMaker *make){
                make.centerY.equalTo(_stationIcon.mas_centerY);
                make.left.equalTo(_stationIcon.mas_right).with.offset(AUTO_SIZE(10));

            }];
            
            [_devideLine mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.equalTo(_stationIcon.mas_bottom).with.offset(AUTO_SIZE(15));
                make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
                make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
                make.height.equalTo(@(ISRetina_Min_Line));
            }];
            
            [_stationNameLabel mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
                make.centerX.equalTo(self.contentView.mas_centerX);
            }];
            
            [_stationDetailLabel mas_makeConstraints:^(MASConstraintMaker *make){
                make.top.equalTo(_stationNameLabel.mas_bottom).with.offset(AUTO_SIZE(5));
                make.centerX.equalTo(self.contentView.mas_centerX);
            }];
        }
            break;
            
        default:
            break;
    }
    
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
