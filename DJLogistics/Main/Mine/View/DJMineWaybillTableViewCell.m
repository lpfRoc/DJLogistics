//
//  DJMineWaybillTableViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineWaybillTableViewCell.h"
#import "DJWaybillModel.h"
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
        [self initSubViews];
    }
    return self;
}

#pragma mark - lazy
- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = AUTO_FONT_SIZE(16);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLOR_FontTitle;
        _titleLabel.text = @"泉州印象";
    }
    return _titleLabel;
}

- (UILabel *)overtimeLabel
{
    if (_overtimeLabel == nil) {
        _overtimeLabel = [[UILabel alloc] init];
        _overtimeLabel.font = AUTO_FONT_SIZE(11);
        _overtimeLabel.textAlignment = NSTextAlignmentRight;
        _overtimeLabel.textColor = COLOR_FontText;
        _overtimeLabel.text = @"未超时";
    }
    return _overtimeLabel;
}

- (UIImageView *)addressIcon
{
    if (_addressIcon == nil) {
        _addressIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_tp"]];
    }
    return _addressIcon;
}
- (UIImageView *)deliveryIcon
{
    if (_deliveryIcon == nil) {
        _deliveryIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_platform"]];
    }
    return _deliveryIcon;
}

- (UILabel *)addressInfoLabel
{
    if (_addressInfoLabel == nil) {
        _addressInfoLabel = [[UILabel alloc] init];
        _addressInfoLabel.font = AUTO_FONT_SIZE(14);
        _addressInfoLabel.textAlignment = NSTextAlignmentLeft;
        _addressInfoLabel.textColor = COLOR_FontText;
        _addressInfoLabel.numberOfLines = 0;
    }
    return _addressInfoLabel;
}

- (UILabel *)deliveryNameLabel
{
    if (_deliveryNameLabel == nil) {
        _deliveryNameLabel = [[UILabel alloc] init];
        _deliveryNameLabel.font = AUTO_FONT_SIZE(14);
        _deliveryNameLabel.textAlignment = NSTextAlignmentLeft;
        _deliveryNameLabel.textColor = COLOR_FontText;
    }
    return _deliveryNameLabel;
}
- (UILabel *)orderTimeLabel
{
    if (_orderTimeLabel== nil) {
        _orderTimeLabel = [[UILabel alloc] init];
        _orderTimeLabel.font = AUTO_FONT_SIZE(14);
        _orderTimeLabel.textAlignment = NSTextAlignmentLeft;
        _orderTimeLabel.textColor = COLOR_FontTitle;
        _orderTimeLabel.text =@"-- 接单";
    }
    return _orderTimeLabel;
}
- (UILabel *)arriveTimeLabel
{
    if (_arriveTimeLabel== nil) {
        _arriveTimeLabel = [[UILabel alloc] init];
        _arriveTimeLabel.font = AUTO_FONT_SIZE(14);
        _arriveTimeLabel.textAlignment = NSTextAlignmentRight;
        _arriveTimeLabel.textColor = COLOR_FontTitle;
        _arriveTimeLabel.text =@"-- 送达";
    }
    return _arriveTimeLabel;
}
- (UILabel *)arriveShopTimeLabel
{
    if (_arriveShopTimeLabel== nil) {
        _arriveShopTimeLabel = [[UILabel alloc] init];
        _arriveShopTimeLabel.font = AUTO_FONT_SIZE(14);
        _arriveShopTimeLabel.textAlignment = NSTextAlignmentRight;
        _arriveShopTimeLabel.textColor = COLOR_FontTitle;
        _arriveShopTimeLabel.text =@"-- 到店";
    }
    return _arriveShopTimeLabel;
}
- (UILabel *)fetchTimeLabel
{
    if (_fetchTimeLabel== nil) {
        _fetchTimeLabel = [[UILabel alloc] init];
        _fetchTimeLabel.font = AUTO_FONT_SIZE(14);
        _fetchTimeLabel.textAlignment = NSTextAlignmentLeft;
        _fetchTimeLabel.textColor = COLOR_FontTitle;
        _fetchTimeLabel.text =@"-- 取餐";
    }
    return _fetchTimeLabel;
}

- (void)initSubViews
{
    NSArray *viewArray = @[self.titleLabel,self.overtimeLabel,self.deliveryIcon,self.addressIcon,self.addressInfoLabel,
                           self.deliveryNameLabel,self.arriveTimeLabel,self.arriveShopTimeLabel,self.fetchTimeLabel,self.orderTimeLabel
                           ];
    for (UIView *view in viewArray) {
        [self.contentView addSubview:view];
    }
    [self autoLayout];
}
- (void)autoLayout
{
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    [_overtimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_titleLabel.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
    }];
    [_addressIcon mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    [_addressInfoLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(AUTO_SIZE( 13));
        make.left.equalTo(_addressIcon.mas_right).with.offset(AUTO_SIZE(5));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));

    }];
    [_deliveryIcon mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_addressInfoLabel.mas_bottom).with.offset(AUTO_SIZE(5));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.size.mas_equalTo(CGSizeMake(15, 15));
        
    }];
    [_deliveryNameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_addressInfoLabel.mas_bottom).with.offset(AUTO_SIZE(5));
        make.left.equalTo(_deliveryIcon.mas_right).with.offset(AUTO_SIZE(5));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
    }];
    
    [_orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_deliveryIcon.mas_bottom).with.offset(AUTO_SIZE(8));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    [_arriveShopTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_deliveryIcon.mas_bottom).with.offset(AUTO_SIZE(8));
        make.right.equalTo(self.contentView.mas_centerX).with.offset(AUTO_SIZE(-10));
    }];
    [_fetchTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_deliveryIcon.mas_bottom).with.offset(AUTO_SIZE(8));
        make.left.equalTo(self.contentView.mas_centerX).with.offset(AUTO_SIZE(10));
    }];
    [_arriveTimeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_deliveryIcon.mas_bottom).with.offset(AUTO_SIZE(8));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
    }];

}

-(void)setModel:(DJWaybillModel *)model
{
    if (model == nil) {
        return;
    }
    _model = model;
    
    NSInteger researchTime = [self configureSecondTimeWithString:[self configureTimeWithString:model.finish]];
    NSInteger grabTime = [self configureSecondTimeWithString:[self configureTimeWithString:model.grab]];
    NSInteger timeout = [model.timeout integerValue];

    NSInteger overTime = researchTime - grabTime- timeout;
    if (researchTime >grabTime+timeout) {
        //送达时间 > timeout + 接单时间
        NSString *str_minute = [NSString stringWithFormat:@"%ld",overTime/60];
        NSString *format_time = [NSString stringWithFormat:@"%@分钟",str_minute];
        _overtimeLabel.text = [NSString stringWithFormat:@"超时%@",format_time];
        _overtimeLabel.textColor = COLOR_Orange;
    }else
    {
        _overtimeLabel.text = @"未超时";
        _overtimeLabel.textColor = COLOR_FontText;
    }
    _titleLabel.text = model.store;
    _addressInfoLabel.text =model.tp_detail;
    _deliveryNameLabel.text = model.platform;
    _orderTimeLabel.text =  [[self configureTimeWithString:model.grab] stringByAppendingString:@" 接单"];
    _arriveShopTimeLabel.text =  [[self configureTimeWithString:model.arrived] stringByAppendingString:@" 到店"] ;
    _fetchTimeLabel.text =  [[self configureTimeWithString:model.get] stringByAppendingString:@" 取餐"];
    _arriveTimeLabel.text = [[self configureTimeWithString:model.finish] stringByAppendingString:@" 送达"];
}
- (NSString *)configureTimeWithString:(NSString *)time {
    
    NSArray *strArr = [time componentsSeparatedByString:@" "];
    NSString *valueTime = strArr[1];
    
    return [valueTime substringToIndex:5];
}
- (NSInteger )configureSecondTimeWithString:(NSString *)time {
    
    NSArray *strArr = [time componentsSeparatedByString:@":"];
    NSString *minute = strArr[1];
    NSString *hour = strArr[0];
    
    return [hour integerValue]*3600 + [minute integerValue]*60;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
+(CGFloat)getWaybillCellHeightByModel:(DJWaybillModel *)model
{
    CGFloat titleLabelH = 20;
    CGFloat timeLbH = 15;
    CGFloat topSpace = AUTO_SIZE(20);
    CGFloat midSpace = AUTO_SIZE(15);
    CGFloat bottomSpace = AUTO_SIZE(10);
    CGFloat timeLbTopSpace = AUTO_SIZE(10);
    
    CGFloat contentLabelH = [DJUtilities getStrLenByFontStyle:model.tp_detail fontStyle:FONT_SIZE(14) textWidth:UI_SCREEN_WIDTH - AUTO_SIZE(50)].height;
    return contentLabelH + titleLabelH + topSpace + midSpace +bottomSpace+timeLbH+timeLbTopSpace+20;
}

@end
