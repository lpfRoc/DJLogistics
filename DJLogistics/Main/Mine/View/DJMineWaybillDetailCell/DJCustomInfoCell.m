//
//  DJCustomInfoCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJCustomInfoCell.h"

@implementation DJCustomInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
#pragma mark - 界面初始化
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_W;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
#pragma mark - lazy

- (UILabel *)customInfoTitle
{
    if (_customInfoTitle == nil) {
        _customInfoTitle = [[UILabel alloc] init];
        _customInfoTitle.font = AUTO_FONT_SIZE(14);
        _customInfoTitle.textAlignment = NSTextAlignmentLeft;
        _customInfoTitle.textColor = COLOR_FontTitle;
        _customInfoTitle.text =@"客户信息";
    }
    return _customInfoTitle;
}

- (UIImageView *)devideLine
{
    if (_devideLine == nil) {
        _devideLine = [[UIImageView alloc] init];
        _devideLine.backgroundColor = COLOR_Line;
    }
    return _devideLine;
}
- (UILabel *)customNameLabel
{
    if (_customNameLabel == nil) {
        _customNameLabel = [[UILabel alloc] init];
        _customNameLabel.font = AUTO_FONT_SIZE(14);
        _customNameLabel.textAlignment = NSTextAlignmentLeft;
        _customNameLabel.textColor = COLOR_FontText;
        _customNameLabel.text = @"元天霸";
    }
    return _customNameLabel;
}

- (UILabel *)phoneLabel
{
    if (_phoneLabel== nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.font = AUTO_FONT_SIZE(14);
        _phoneLabel.textAlignment = NSTextAlignmentLeft;
        _phoneLabel.textColor = COLOR_FontText;
        _phoneLabel.text = @"13843859438";
    }
    return _phoneLabel;
}
- (UILabel *)addressLabel
{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = AUTO_FONT_SIZE(14);
        _addressLabel.textAlignment = NSTextAlignmentLeft;
        _addressLabel.textColor = COLOR_FontText;
        _addressLabel.numberOfLines = 0;
        _addressLabel.text = @"上海浦东戏曲的空间阿森松岛卡经典款阿斯顿啊到啊到108号 （大教室）";
    }
    return _addressLabel;
}
- (UIButton *)GPSBtn
{
    if (_GPSBtn == nil) {
        
        _GPSBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _GPSBtn.tag = 100;
        [_GPSBtn addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_GPSBtn setImage:[UIImage imageNamed:@"icon_gpsbtn"] forState:(UIControlStateNormal)];
    }
    return _GPSBtn;
}
- (UIButton *)callBtn
{
    if (_callBtn == nil) {
        
        _callBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _callBtn.tag = 101;
        [_callBtn addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_callBtn setImage:[UIImage imageNamed:@"icon_callbtn"] forState:(UIControlStateNormal)];
    }
    return _callBtn;
}
- (UIButton *)messageBtn
{
    if (_messageBtn == nil) {
        _messageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _messageBtn.tag = 102;
        [_messageBtn addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_messageBtn setImage:[UIImage imageNamed:@"icon_messagebtn"] forState:(UIControlStateNormal)];
    }
    return _messageBtn;
}
-(void)setCustomInfoCellTpe:(DJCustomInfoCellTpe)customInfoCellTpe
{
    _customInfoCellTpe = customInfoCellTpe;
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    switch (customInfoCellTpe) {
        case DJCustomInfoCellTypeDefault:
        {
            NSArray *viewArray = @[self.customInfoTitle,self.devideLine,self.customNameLabel,self.phoneLabel,self.addressLabel];
            for (UIView *view in viewArray) {
                [self.contentView addSubview:view];
            }
        }
            break;
        case DJCustomInfoCellTypeBtn:
        {
            NSArray *viewArray = @[self.customInfoTitle,self.devideLine,self.customNameLabel,self.phoneLabel,self.addressLabel,self.callBtn,self.GPSBtn,self.messageBtn];
            for (UIView *view in viewArray) {
                [self.contentView addSubview:view];
            }
        }
            break;
        default:
            break;
    }
    [self autoLayout:customInfoCellTpe];

}
- (void)autoLayout:(DJCustomInfoCellTpe)cellTpe;
{
    [_customInfoTitle mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
    [_devideLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_customInfoTitle.mas_bottom).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
        make.height.equalTo(@(ISRetina_Min_Line));
    }];
    
    [_customNameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_customNameLabel.mas_bottom).with.offset(AUTO_SIZE(5));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_phoneLabel.mas_bottom).with.offset(AUTO_SIZE(5));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
    }];
    if (cellTpe == DJCustomInfoCellTypeBtn) {
        [_callBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_addressLabel.mas_bottom).with.offset(AUTO_SIZE(10));
            make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
            make.size.mas_equalTo(CGSizeMake(75, 32));
        }];
        
        [_messageBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_addressLabel.mas_bottom).with.offset(AUTO_SIZE(10));
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(75, 32));

        }];
        [_GPSBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_addressLabel.mas_bottom).with.offset(AUTO_SIZE(10));
            make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
            make.size.mas_equalTo(CGSizeMake(75, 32));

        }];
    }
    
}
- (void)btnAction:(UIButton *)btn
{
    switch (btn.tag) {
        case 100:
        {
            NSLog(@"call");
        }
            break;
        case 101:
        {
            NSLog(@"message");

        }
            break;
        case 102:
        {
            NSLog(@"gps");

        }
            break;
            
        default:
            break;
    }
}
-(void)setModel:(DJMineWayBillModel *)model
{
    _model = model;
    _customNameLabel.text =model.tp_er;
    _phoneLabel.text =model.tp_phone;
    _addressLabel.text =model.tp_detail;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
