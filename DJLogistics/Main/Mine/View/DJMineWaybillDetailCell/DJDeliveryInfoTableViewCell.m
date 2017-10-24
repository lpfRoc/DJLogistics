//
//  DJDeliveryInfoTableViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJDeliveryInfoTableViewCell.h"

@implementation DJDeliveryInfoTableViewCell

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
        [self initSubViews];
    }
    return self;
}
#pragma mark - lazy

- (UILabel *)deliveryTitle
{
    if (_deliveryTitle == nil) {
        _deliveryTitle = [[UILabel alloc] init];
        _deliveryTitle.font = AUTO_FONT_SIZE(14);
        _deliveryTitle.textAlignment = NSTextAlignmentLeft;
        _deliveryTitle.textColor = COLOR_FontTitle;
        _deliveryTitle.text =@"配送信息";
    }
    return _deliveryTitle;
}

- (UIImageView *)devideLine
{
    if (_devideLine == nil) {
        _devideLine = [[UIImageView alloc] init];
        _devideLine.backgroundColor = COLOR_Line;
    }
    return _devideLine;
}
- (UILabel *)orderTimeLabel
{
    if (_orderTimeLabel == nil) {
        _orderTimeLabel = [[UILabel alloc] init];
        _orderTimeLabel.font = AUTO_FONT_SIZE(12);
        _orderTimeLabel.textAlignment = NSTextAlignmentCenter;
        _orderTimeLabel.textColor = COLOR_BlueDark;
        _orderTimeLabel.numberOfLines = 0;
        _orderTimeLabel.text = @"接单\n12:12";
    }
    return _orderTimeLabel;
}

- (UILabel *)fetchTimeLabel
{
    if (_fetchTimeLabel == nil) {
        _fetchTimeLabel = [[UILabel alloc] init];
        _fetchTimeLabel.font = AUTO_FONT_SIZE(12);
        _fetchTimeLabel.textAlignment = NSTextAlignmentCenter;
        _fetchTimeLabel.textColor = COLOR_BlueDark;
        _fetchTimeLabel.numberOfLines = 0;
        _fetchTimeLabel.text = @"取餐\n12:12";
    }
    return _fetchTimeLabel;
}
- (UILabel *)arriveShopTimeLabel
{
    if (_arriveShopTimeLabel == nil) {
        _arriveShopTimeLabel = [[UILabel alloc] init];
        _arriveShopTimeLabel.font = AUTO_FONT_SIZE(12);
        _arriveShopTimeLabel.textAlignment = NSTextAlignmentCenter;
        _arriveShopTimeLabel.textColor = COLOR_BlueDark;
        _arriveShopTimeLabel.numberOfLines = 0;
        _arriveShopTimeLabel.text = @"到店\n12:12";
    }
    return _arriveShopTimeLabel;
}
- (UILabel *)arriveTimeLabel
{
    if (_arriveTimeLabel == nil) {
        _arriveTimeLabel = [[UILabel alloc] init];
        _arriveTimeLabel.font = AUTO_FONT_SIZE(12);
        _arriveTimeLabel.textAlignment = NSTextAlignmentCenter;
        _arriveTimeLabel.textColor = COLOR_BlueDark;
        _arriveTimeLabel.numberOfLines = 0;
        _arriveTimeLabel.text = @"接单\n12:12";
    }
    return _arriveTimeLabel;
}
- (void)initSubViews
{
    NSArray *viewArray = @[self.deliveryTitle,self.devideLine,self.orderTimeLabel,self.arriveShopTimeLabel,self.fetchTimeLabel,self.arriveTimeLabel];
    for (UIView *view in viewArray) {
        [self.contentView addSubview:view];
    }
    [self autoLayout];
}
- (void)autoLayout
{
    [_deliveryTitle mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];

    [_devideLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_deliveryTitle.mas_bottom).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
        make.height.equalTo(@(ISRetina_Min_Line));
    }];
    
    [_orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(40));
    }];
    
    [_arriveShopTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.right.equalTo(self.contentView.mas_centerX).with.offset(AUTO_SIZE(-30));
    }];
    [_fetchTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.left.equalTo(self.contentView.mas_centerX).with.offset(AUTO_SIZE(30));
    }];
    [_arriveTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-40));
    }];
    
}
-(void)setModel:(DJMineWayBillModel *)model
{
    _model = model;
    _orderTimeLabel.text =  [NSString stringWithFormat:@"接单\n%@",[self configureTimeWithString:model.grab] ];
    _arriveShopTimeLabel.text =  [NSString stringWithFormat:@"到店\n%@",[self configureTimeWithString:model.arrived] ];;
    _fetchTimeLabel.text = [NSString stringWithFormat:@"取餐\n%@",[self configureTimeWithString:model.get] ];
    _arriveTimeLabel.text = [NSString stringWithFormat:@"送达\n%@",[self configureTimeWithString:model.finish] ];
    
}
- (NSString *)configureTimeWithString:(NSString *)time {
    
    NSArray *strArr = [time componentsSeparatedByString:@" "];
    NSString *valueTime = strArr[1];
    
    return [valueTime substringToIndex:5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
