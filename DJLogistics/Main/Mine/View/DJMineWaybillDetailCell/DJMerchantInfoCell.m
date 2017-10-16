//
//  DJMerchantInfoCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMerchantInfoCell.h"

@implementation DJMerchantInfoCell

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

- (UILabel *)merchantTitle
{
    if (_merchantTitle == nil) {
        _merchantTitle = [[UILabel alloc] init];
        _merchantTitle.font = AUTO_FONT_SIZE(14);
        _merchantTitle.textAlignment = NSTextAlignmentLeft;
        _merchantTitle.textColor = COLOR_FontTitle;
        _merchantTitle.text =@"商家信息";
    }
    return _merchantTitle;
}

- (UIImageView *)devideLine
{
    if (_devideLine == nil) {
        _devideLine = [[UIImageView alloc] init];
        _devideLine.backgroundColor = COLOR_Line;
    }
    return _devideLine;
}
- (UILabel *)merchantName
{
    if (_merchantName == nil) {
        _merchantName = [[UILabel alloc] init];
        _merchantName.font = AUTO_FONT_SIZE(14);
        _merchantName.textAlignment = NSTextAlignmentLeft;
        _merchantName.textColor = COLOR_FontText;
        _merchantName.text = @"泉州印象（张江店）";
    }
    return _merchantName;
}

- (UILabel *)addressLabel
{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = AUTO_FONT_SIZE(14);
        _addressLabel.textAlignment = NSTextAlignmentLeft;
        _addressLabel.textColor = COLOR_FontText;
        _addressLabel.numberOfLines = 0;
        _addressLabel.text = @"浦东新区晨晖路198号啦啦啦 102室";
    }
    return _addressLabel;
}
- (UIButton *)GPSBtn
{
    if (_GPSBtn == nil) {
        
        _GPSBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_GPSBtn addTarget:self action:@selector(GPSAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_GPSBtn setImage:[UIImage imageNamed:@"icon_gpsbtn"] forState:(UIControlStateNormal)];
    }
    return _GPSBtn;
}
- (void)initSubViews
{
    NSArray *viewArray = @[self.merchantTitle,self.devideLine,self.merchantName,self.addressLabel,self.GPSBtn];
    for (UIView *view in viewArray) {
        [self.contentView addSubview:view];
    }
    [self autoLayout];
}
- (void)autoLayout
{
    [_merchantTitle mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
    [_devideLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_merchantTitle.mas_bottom).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
        make.height.equalTo(@(ISRetina_Min_Line));
    }];
    
    [_merchantName mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.width.equalTo(@(200));

    }];
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_merchantName.mas_bottom).with.offset(AUTO_SIZE(5));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-90));

    }];
    [_GPSBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-10));
        make.size.mas_equalTo(CGSizeMake(75, 32));
    }];
    
}
-(void)GPSAction:(UIButton *)btn
{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
